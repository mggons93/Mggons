﻿# Importar las librerías necesarias
Add-Type -AssemblyName PresentationFramework

# Determinar si el sistema operativo es de 64 bits
$is64Bit = [Environment]::Is64BitOperatingSystem

# Minimizar la ventana de PowerShell
Add-Type @"
using System;
using System.Runtime.InteropServices;

public class Win32 {
    [DllImport("user32.dll")]
    [return: MarshalAs(UnmanagedType.Bool)]
    public static extern bool ShowWindow(IntPtr hWnd, int nCmdShow);
    [DllImport("kernel32.dll", ExactSpelling = true)]
    public static extern IntPtr GetConsoleWindow();
}
"@

$consolePtr = [Win32]::GetConsoleWindow()
[Win32]::ShowWindow($consolePtr, 6) # 6 = Minimizar la ventana

# Crear la ventana sin ícono
[xml]$xaml = @"
<Window xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation" 
        xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
        Title="Microsoft Office Online By Mggons" Height="420" Width="450">
    <Grid>
        <!-- Fila 1 -->
        <TextBlock Text="Seleccionar Office 365:" HorizontalAlignment="Left" VerticalAlignment="Top" Margin="10,10,0,0"/>
        <ComboBox x:Name="variantComboBox" HorizontalAlignment="Left" VerticalAlignment="Top" Width="200" Margin="10,30,0,0">
            <ComboBoxItem Content="O365ProPlusRetail"/>
            <ComboBoxItem Content="O365ProPlusEEANoTeamsRetail"/>
            <ComboBoxItem Content="O365BusinessRetail"/>
            <ComboBoxItem Content="O365BusinessEEANoTeamsRetail"/>
            <ComboBoxItem Content="O365EduCloudRetail"/>
            <ComboBoxItem Content="O365HomePremRetail"/>
            <ComboBoxItem Content="O365SmallBusPremRetail"/>
            <ComboBoxItem Content="ProjectProRetail"/>
            <ComboBoxItem Content="VisioProRetail"/>
        </ComboBox>
        <CheckBox x:Name="architectureCheckBox" Content="Sistema operativo x64" IsChecked="$($is64Bit)" HorizontalAlignment="Left" VerticalAlignment="Top" Margin="220,30,0,0" IsEnabled="True"/>

        <!-- Fila 2 -->
        <TextBlock Text="Selección de Idioma:" HorizontalAlignment="Left" VerticalAlignment="Top" Margin="10,70,0,0"/>
        <ComboBox x:Name="languageComboBox" HorizontalAlignment="Left" VerticalAlignment="Top" Width="200" Margin="10,90,0,0">
           <ComboBoxItem Content="English [en-US]"/>
            <ComboBoxItem Content="Arabic [ar-SA]"/>
            <ComboBoxItem Content="Bulgarian [bg-BG]"/>
            <ComboBoxItem Content="Czech [cs-CZ]"/>
            <ComboBoxItem Content="Danish [da-DK]"/>
            <ComboBoxItem Content="German [de-DE]"/>
            <ComboBoxItem Content="Greek [el-GR]"/>
            <ComboBoxItem Content="English UK [en-GB]"/>
            <ComboBoxItem Content="Spanish [es-ES]"/>
            <ComboBoxItem Content="Spanish Mexico [es-MX]"/>
            <ComboBoxItem Content="Estonian [et-EE]"/>
            <ComboBoxItem Content="Finnish [fi-FI]"/>
            <ComboBoxItem Content="French Canada [fr-CA]"/>
            <ComboBoxItem Content="French [fr-FR]"/>
            <ComboBoxItem Content="Hebrew [he-IL]"/>
            <ComboBoxItem Content="Hindi [hi-IN]"/>
            <ComboBoxItem Content="Croatian [hr-HR]"/>
            <ComboBoxItem Content="Hungarian [hu-HU]"/>
            <ComboBoxItem Content="Indonesian [id-ID]"/>
            <ComboBoxItem Content="Italian [it-IT]"/>
            <ComboBoxItem Content="Japanese [ja-JP]"/>
            <ComboBoxItem Content="Kazakh [kk-KZ]"/>
            <ComboBoxItem Content="Korean [ko-KR]"/>
            <ComboBoxItem Content="Lithuanian [lt-LT]"/>
            <ComboBoxItem Content="Latvian [lv-LV]"/>
            <ComboBoxItem Content="Malay (Latin) [ms-MY]"/>
            <ComboBoxItem Content="Norwegian Bokmal [nb-NO]"/>
            <ComboBoxItem Content="Dutch [nl-NL]"/>
            <ComboBoxItem Content="Polish [pl-PL]"/>
            <ComboBoxItem Content="Portuguese (Brazil) [pt-BR]"/>
            <ComboBoxItem Content="Portuguese (Portugal) [pt-PT]"/>
            <ComboBoxItem Content="Romanian [ro-RO]"/>
            <ComboBoxItem Content="Russian [ru-RU]"/>
            <ComboBoxItem Content="Slovak [sk-SK]"/>
            <ComboBoxItem Content="Slovenian [sl-SI]"/>
            <ComboBoxItem Content="Serbian (Latin, Serbia) [sr-latn-CS]"/>
            <ComboBoxItem Content="Serbian (Latin, Serbia) [sr-latn-RS]"/>
            <ComboBoxItem Content="Swedish [sv-SE]"/>
            <ComboBoxItem Content="Thai [th-TH]"/>
            <ComboBoxItem Content="Turkish [tr-TR]"/>
            <ComboBoxItem Content="Ukrainian [uk-UA]"/>
            <ComboBoxItem Content="Vietnamese [vi-VN]"/>
            <ComboBoxItem Content="Chinese (Simplified) [zh-CN]"/>
            <ComboBoxItem Content="Chinese (Traditional) [zh-TW]"/>
            <!-- Agrega aquí más opciones si es necesario -->
        </ComboBox>
        <CheckBox x:Name="vlActivationCheckBox" Content="Usar Activación VL" HorizontalAlignment="Left" VerticalAlignment="Top" Margin="220,90,0,0"/>
        
        <!-- Opciones de Activación VL solo si se activa VL -->
        <StackPanel x:Name="vlOptionsPanel" Visibility="Collapsed" HorizontalAlignment="Left" VerticalAlignment="Top" Margin="10,130,0,0" Orientation="Horizontal">
            <StackPanel Orientation="Vertical" Margin="0,0,10,0">
                <TextBlock Text="Seleccione la edición:" HorizontalAlignment="Left" Margin="0,0,0,5"/>
                <ComboBox x:Name="editionComboBox" HorizontalAlignment="Left" Width="200">
                    <ComboBoxItem Content="Office 2016 STD VL"/>
                    <ComboBoxItem Content="Office 2016 PRO VL"/>
                    <ComboBoxItem Content="Office 2019 STD VL"/>
                    <ComboBoxItem Content="Office 2019 PRO VL"/>
                    <ComboBoxItem Content="Office 2021 STD VL"/>
                    <ComboBoxItem Content="Office 2021 PRO VL"/>
                    <ComboBoxItem Content="Project 2016 STD VL"/>
                    <ComboBoxItem Content="Project 2016 PRO VL"/>
                    <ComboBoxItem Content="Project 2019 STD VL"/>
                    <ComboBoxItem Content="Project 2019 PRO VL"/>
                    <ComboBoxItem Content="Project 2021 STD VL"/>
                    <ComboBoxItem Content="Project 2021 PRO VL"/>
                    <ComboBoxItem Content="Visio 2016 STD VL"/>
                    <ComboBoxItem Content="Visio 2016 PRO VL"/>
                    <ComboBoxItem Content="Visio 2019 STD VL"/>
                    <ComboBoxItem Content="Visio 2019 PRO VL"/>
                    <ComboBoxItem Content="Visio 2021 STD VL"/>
                    <ComboBoxItem Content="Visio 2021 PRO VL"/>
                </ComboBox>
            </StackPanel>
            <StackPanel Orientation="Vertical">
                <TextBlock Text="Ingrese la clave de licencia:" HorizontalAlignment="Left" Margin="0,0,0,7"/>
                <TextBox x:Name="licenseKeyTextBox" HorizontalAlignment="Left" Width="200"/>
            </StackPanel>
        </StackPanel>

        <!-- Botón de instalación y log -->
        <Button x:Name="installButton" Content="Instalar" HorizontalAlignment="Left" VerticalAlignment="Top" Width="100" Height="30" Margin="10,200,0,0"/>
        <CheckBox x:Name="autoActivationCheckBox" Content="Activación Automática" HorizontalAlignment="Left" VerticalAlignment="Top" Margin="120,205,0,0"/>
        <TextBlock Text="Log:" HorizontalAlignment="Left" VerticalAlignment="Top" Margin="10,240,0,0"/>
        <TextBox x:Name="logTextBox" HorizontalAlignment="Left" VerticalAlignment="Top" Width="410" Height="100" Margin="10,260,0,0" IsReadOnly="True" VerticalScrollBarVisibility="Auto"/>
    </Grid>
</Window>
"@

# Cargar el XAML
$reader = (New-Object System.Xml.XmlNodeReader $xaml)
$window = [Windows.Markup.XamlReader]::Load($reader)

# Obtener los elementos
$variantComboBox = $window.FindName("variantComboBox")
$languageComboBox = $window.FindName("languageComboBox")
$vlActivationCheckBox = $window.FindName("vlActivationCheckBox")
$architectureCheckBox = $window.FindName("architectureCheckBox")
$editionComboBox = $window.FindName("editionComboBox")
$licenseKeyTextBox = $window.FindName("licenseKeyTextBox")
$installButton = $window.FindName("installButton")
$logTextBox = $window.FindName("logTextBox")
$vlOptionsPanel = $window.FindName("vlOptionsPanel")
$autoActivationCheckBox = $window.FindName("autoActivationCheckBox")

# Función para agregar mensajes al log
function Add-LogMessage {
    param (
        [string]$message
    )
    $logTextBox.Text += "$message`r`n"
}

# Manejar el evento Checked del CheckBox de activación VL
$vlActivationCheckBox.Add_Checked({
    $vlOptionsPanel.Visibility = 'Visible'
    $autoActivationCheckBox.IsChecked = $false
    $autoActivationCheckBox.IsEnabled = $false
})

# Manejar el evento Unchecked del CheckBox de activación VL
$vlActivationCheckBox.Add_Unchecked({
    $vlOptionsPanel.Visibility = 'Collapsed'
    $autoActivationCheckBox.IsEnabled = $true
    $autoActivationCheckBox.IsChecked = $false
})

# Manejar el evento Checked del CheckBox de activación automática
$autoActivationCheckBox.Add_Checked({
    $vlActivationCheckBox.IsChecked = $false
})

# Manejar el evento Unchecked del CheckBox de activación automática
$autoActivationCheckBox.Add_Unchecked({
    if (-not $vlActivationCheckBox.IsChecked) {
        $autoActivationCheckBox.IsChecked = $false
    }
})

# Definir la acción del botón
$installButton.Add_Click({
    $selectedVariant = $variantComboBox.SelectedItem.Content
    $selectedLanguageFull = $languageComboBox.SelectedItem.Content
    $selectedLanguage = $selectedLanguageFull -replace '.*\[(.*?)\]', '$1'
    $architecture = if ($architectureCheckBox.IsChecked) { "x64" } else { "x86" }
    $useVL = $vlActivationCheckBox.IsChecked
    $editionVL = if ($useVL) { $editionComboBox.SelectedItem.Content } else { $null }
    $licenseKey = if ($useVL) { $licenseKeyTextBox.Text } else { $null }
    $autoActivate = $autoActivationCheckBox.IsChecked

    # URL de descarga
    $url = "https://c2rsetup.officeapps.live.com/c2r/download.aspx?ProductreleaseID=$selectedVariant&platform=$architecture&language=$selectedLanguage&version=O16GA"
    $outputFile = "$env:TEMP\${selectedVariant}-${selectedLanguage}-${architecture}.exe"

    # Confirmar la instalación
    $message = "Se procederá a descargar e instalar la siguiente variante de Office 365. ¿Desea continuar?"
    if ($useVL) {
        $message += "`n\n- Edición VL: $editionVL"
        $message += "`n- Clave de licencia: $licenseKey"
    }
    $message += "`n- Variante: $selectedVariant"
    $message += "`n- Idioma: $selectedLanguage"
    $message += "`n- Sistema: $architecture"
    $message += "`n- Activación Automática: $($autoActivate -eq $true)"
    $result = [System.Windows.MessageBox]::Show($message, "Confirmar Instalación", [System.Windows.MessageBoxButton]::YesNo, [System.Windows.MessageBoxImage]::Question)

    if ($result -eq [System.Windows.MessageBoxResult]::Yes) {
        # Agregar mensaje al log
        Add-LogMessage "Descargando $selectedVariant $selectedLanguage para sistema $architecture..."
		Add-LogMessage "Descarga completada. Iniciando la instalación..."
        Invoke-WebRequest -Uri $url -OutFile $outputFile
       
        # Ejecutar el instalador en modo silencioso
        Start-Process -FilePath $outputFile -Wait
        "taskkill /f /im OfficeC2RClient.exe" | cmd

        # Agregar mensaje al log
        Add-LogMessage "Instalación completada."

        # Activación automática si se seleccionó
        if ($autoActivate -and -not $useVL) {
            Add-LogMessage "Iniciando Activacion. Espere..."
           
            # AquÃ­ puedes aÃ±adir el cÃ³digo del script de activaciÃ³n personalizado
            # Ejemplo:
            # Construir el enlace de descarga
            $url = "https://raw.githubusercontent.com/massgravel/Microsoft-Activation-Scripts/master/MAS/All-In-One-Version/MAS_AIO-CRC32_31F7FD1E.cmd" 
            $outputPath1 = "$env:TEMP\MAS_AIO-CRC32_31F7FD1E.cmd"
            # Descargar el archivo
			Add-LogMessage "Activando..."
            Invoke-WebRequest -Uri $url -OutFile $outputPath1
            Start-Process -FilePath $outputPath1 /Ohook -Wait 
            Add-LogMessage "Eliminando Archivos Usados..."
	        Remove-Item -Path $outputFile -Force
            Remove-Item -Path $outputPath1 -Force
            Add-LogMessage "Activación completada."
        }

       if ($useVL) {
        Add-LogMessage "Convirtiendo Office Retail a Vol. Espere..."
        
        # Activación VL según edición
        $edition = switch ($editionVL) {
            "Office 2016 STD VL" { "StandardVL" }
            "Office 2016 PRO VL" { "ProPlusVL" }
            "Office 2019 STD VL" { "Standard2019VL" }
            "Office 2019 PRO VL" { "ProPlus2019VL" }
            "Office 2021 STD VL" { "Standard2021VL" }
            "Office 2021 PRO VL" { "ProPlus2021VL" }
            "Project 2016 STD VL" { "ProjectStdVL" }
            "Project 2016 PRO VL" { "ProjectProVL" }
            "Project 2019 STD VL" { "ProjectStd2019VL" }
            "Project 2019 PRO VL" { "ProjectPro2019VL" }
            "Project 2021 STD VL" { "ProjectStd2021VL" }
            "Project 2021 PRO VL" { "ProjectPro2021VL" }
            "Visio 2016 STD VL" { "VisioStdVL" }
            "Visio 2016 PRO VL" { "VisioProVL" }
            "Visio 2019 STD VL" { "VisioStd2019VL" }
            "Visio 2019 PRO VL" { "VisioPro2019VL" }
            "Visio 2021 STD VL" { "VisioStd2021VL" }
            "Visio 2021 PRO VL" { "VisioPro2021VL" }
        }

        Add-LogMessage "Edición seleccionada: $editionVL ($edition)"

        # Cambiar al directorio de Microsoft Office (64 bits)
        if (Test-Path "$env:ProgramFiles\Microsoft Office\Office16") {
            Set-Location "$env:ProgramFiles\Microsoft Office\Office16"
            Add-LogMessage "Cambiado al directorio: $env:ProgramFiles\Microsoft Office\Office16"
        } elseif (Test-Path "$env:ProgramFiles(x86)\Microsoft Office\Office16") {
            # Cambiar al directorio de Microsoft Office (32 bits)
            Set-Location "$env:ProgramFiles(x86)\Microsoft Office\Office16"
            Add-LogMessage "Cambiado al directorio: $env:ProgramFiles(x86)\Microsoft Office\Office16"
        } else {
            $errorMsg = "No se encontró la instalación de Microsoft Office en Office16."
            Add-LogMessage $errorMsg
            Write-Error $errorMsg
            exit
        }

        # Obtener la lista de archivos .xrm-ms en el directorio específico
        $licenseFiles = Get-ChildItem -Path "..\root\Licenses16\" -Filter "$edition*.xrm-ms"
        Add-LogMessage "Archivos de licencia encontrados: $($licenseFiles.Count)"
        
        # Iterar sobre cada archivo y ejecutar el comando cscript
        foreach ($file in $licenseFiles) {
            $filePath = "..\root\Licenses16\$($file.Name)"
            Add-LogMessage "Instalando Archivo: $filePath"
            cscript ospp.vbs /inslic:"$filePath"
        }
            Add-LogMessage "Instalando licencia: $licenseKey"
            cscript ospp.vbs /inpkey:$licenseKey
            cscript ospp.vbs /act
            Add-LogMessage "Activación completada."
        }
    }
})

# Mostrar la ventana
$window.ShowDialog() | Out-Null

# Restaurar la ventana de PowerShell a su estado original
[Win32]::ShowWindow($consolePtr, 9) # 9 = Restaurar la ventana
