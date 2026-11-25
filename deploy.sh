cd ~/mynewproject
cat > deploy.sh << 'EOF'
#!/bin/bash
set -e
test -f index.html
cp index.html /var/www/html/index.html
curl -sf http://localhost/ | grep "MynewProject"
echo "Website deployed"
EOF
chmod +x deploy.sh
