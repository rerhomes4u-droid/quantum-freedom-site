// REPLACE THE SCRIPT SECTION IN SPANISH VERSION WITH THIS:

<script>
    // DEBUG SYSTEM
    let debugMode = false;

    function toggleDebug() {
        debugMode = !debugMode;
        const debugInfo = document.getElementById('debugInfo');
        debugInfo.style.display = debugMode ? 'block' : 'none';
        log(`Modo debug ${debugMode ? 'ACTIVADO' : 'DESACTIVADO'}`);
    }

    function debugLog(message) {
        if (debugMode) {
            const debugInfo = document.getElementById('debugInfo');
            debugInfo.textContent = `DEBUG: ${message}`;
            console.log(`DEBUG: ${message}`);
        }
    }

    // ENS LEGIS SYSTEM - VERSIÓN ESPAÑOL CORREGIDA
    class EnsLegisSystem {
        constructor() {
            this.history = [];
            this.documents = {};
            this.init();
        }
        
        init() {
            debugLog('Constructor inicializado');
            this.log('Sistema Maestro ENS LEGIS inicializado');
            this.log('Sistema de liberación legal operativo');
            this.updateStatus('SISTEMA ACTIVO - LISTO PARA LIBERACIÓN');
            debugLog('Inicialización del sistema completada');
        }
        
        executeCommand(command) {
            debugLog(`Ejecutando comando: ${command}`);
            this.log(`Ejecutando comando: ${command}`);
            
            try {
                switch(command) {
                    case 'theory':
                        this.showEnsLegisTheory();
                        break;
                    // ... resto de casos igual
                    default:
                        this.log('Comando no reconocido');
                }
                debugLog(`Comando ${command} ejecutado exitosamente`);
            } catch (error) {
                debugLog(`Error ejecutando comando ${command}: ${error}`);
                this.log(`ERROR DEL SISTEMA: ${error}`);
            }
        }
        
        // ... resto de métodos igual pero con debugLog en cada uno
    }

    // INICIALIZACIÓN CORREGIDA
    let ensLegis;

    function executeCommand(command) {
        if (!ensLegis) {
            ensLegis = new EnsLegisSystem();
        }
        ensLegis.executeCommand(command);
    }

    // INICIALIZAR AL CARGAR
    document.addEventListener('DOMContentLoaded', function() {
        debugLog('DOM completamente cargado');
        ensLegis = new EnsLegisSystem();
    });

    // FALLBACK: Si DOM ready no funciona
    document.addEventListener('click', function initOnClick() {
        if (!ensLegis) {
            ensLegis = new EnsLegisSystem();
            document.removeEventListener('click', initOnClick);
        }
    });
</script>