Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F412E187CE7
	for <lists+linux-rtc@lfdr.de>; Tue, 17 Mar 2020 10:42:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727159AbgCQJlG (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 17 Mar 2020 05:41:06 -0400
Received: from v6.sk ([167.172.42.174]:50682 "EHLO v6.sk"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727123AbgCQJlC (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Tue, 17 Mar 2020 05:41:02 -0400
Received: from localhost (v6.sk [IPv6:::1])
        by v6.sk (Postfix) with ESMTP id 66F1761097;
        Tue, 17 Mar 2020 09:40:58 +0000 (UTC)
From:   Lubomir Rintel <lkundrak@v3.sk>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mark Brown <broonie@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-media@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-rtc@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-usb@vger.kernel.org,
        Lubomir Rintel <lkundrak@v3.sk>
Subject: [PATCH 21/28] dt-bindings: gpio: Convert mrvl-gpio to json-schema
Date:   Tue, 17 Mar 2020 10:39:15 +0100
Message-Id: <20200317093922.20785-22-lkundrak@v3.sk>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200317093922.20785-1-lkundrak@v3.sk>
References: <20200317093922.20785-1-lkundrak@v3.sk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

This converts the mrvl-gpio binding to DT schema format using json-schema.

Various fixes were done during the conversion, such as adding more
properties that are in fact mandatory or extending the examples to
include child nodes with extra GPIO blocks.

The compatible strings are a mess. It is not clear why so many of them
are needed; the driver doesn't really seem to differentiate between the
models. Some of them, like marvell,pxa93x-gpio and marvell,pxa1928-gpio
are not used at all, so it's not known how many interrupts they utilize.
On the other hand, mrvl,pxa-gpio has been seen in the tree, but it
doesn't end up in any actual DTB file.

In any case -- the schema merely copies whatever was in the original
binding document, so it's hopefully no more wrong that the original.

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
---
 .../devicetree/bindings/gpio/mrvl-gpio.txt    |  48 -----
 .../devicetree/bindings/gpio/mrvl-gpio.yaml   | 173 ++++++++++++++++++
 2 files changed, 173 insertions(+), 48 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/gpio/mrvl-gpio.txt
 create mode 100644 Documentation/devicetree/bindings/gpio/mrvl-gpio.yaml

diff --git a/Documentation/devicetree/bindings/gpio/mrvl-gpio.txt b/Documentation/devicetree/bindings/gpio/mrvl-gpio.txt
deleted file mode 100644
index 30fd2201b3d4c..0000000000000
--- a/Documentation/devicetree/bindings/gpio/mrvl-gpio.txt
+++ /dev/null
@@ -1,48 +0,0 @@
-* Marvell PXA GPIO controller
-
-Required properties:
-- compatible : Should be "intel,pxa25x-gpio", "intel,pxa26x-gpio",
-		"intel,pxa27x-gpio", "intel,pxa3xx-gpio",
-		"marvell,pxa93x-gpio", "marvell,mmp-gpio",
-		"marvell,mmp2-gpio" or marvell,pxa1928-gpio.
-- reg : Address and length of the register set for the device
-- interrupts : Should be the port interrupt shared by all gpio pins.
-  There're three gpio interrupts in arch-pxa, and they're gpio0,
-  gpio1 and gpio_mux. There're only one gpio interrupt in arch-mmp,
-  gpio_mux.
-- interrupt-names : Should be the names of irq resources. Each interrupt
-  uses its own interrupt name, so there should be as many interrupt names
-  as referenced interrupts.
-- interrupt-controller : Identifies the node as an interrupt controller.
-- #interrupt-cells: Specifies the number of cells needed to encode an
-  interrupt source.
-- gpio-controller : Marks the device node as a gpio controller.
-- #gpio-cells : Should be two.  The first cell is the pin number and
-  the second cell is used to specify flags. See gpio.txt for possible
-  values.
-
-Example for a MMP platform:
-
-	gpio: gpio@d4019000 {
-		compatible = "marvell,mmp-gpio";
-		reg = <0xd4019000 0x1000>;
-		interrupts = <49>;
-		interrupt-names = "gpio_mux";
-		gpio-controller;
-		#gpio-cells = <2>;
-		interrupt-controller;
-		#interrupt-cells = <1>;
-      };
-
-Example for a PXA3xx platform:
-
-	gpio: gpio@40e00000 {
-		compatible = "intel,pxa3xx-gpio";
-		reg = <0x40e00000 0x10000>;
-		interrupt-names = "gpio0", "gpio1", "gpio_mux";
-		interrupts = <8 9 10>;
-		gpio-controller;
-		#gpio-cells = <0x2>;
-		interrupt-controller;
-		#interrupt-cells = <0x2>;
-	};
diff --git a/Documentation/devicetree/bindings/gpio/mrvl-gpio.yaml b/Documentation/devicetree/bindings/gpio/mrvl-gpio.yaml
new file mode 100644
index 0000000000000..5c713bf59b06d
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/mrvl-gpio.yaml
@@ -0,0 +1,173 @@
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/mrvl-gpio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Marvell PXA GPIO controller
+
+maintainers:
+  - devicetree@vger.kernel.org
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - intel,pxa25x-gpio
+              - intel,pxa26x-gpio
+              - intel,pxa27x-gpio
+              - intel,pxa3xx-gpio
+    then:
+      properties:
+        interrupts:
+          minItems: 3
+          maxItems: 3
+        interrupt-names:
+          items:
+            - const: gpio0
+            - const: gpio1
+            - const: gpio_mux
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - marvell,mmp-gpio
+              - marvell,mmp2-gpio
+    then:
+      properties:
+        interrupts:
+          maxItems: 1
+        interrupt-names:
+          items:
+            - const: gpio_mux
+
+properties:
+  $nodename:
+    pattern: '^gpio@[0-9a-f]+$'
+
+  compatible:
+    enum:
+      - intel,pxa25x-gpio
+      - intel,pxa26x-gpio
+      - intel,pxa27x-gpio
+      - intel,pxa3xx-gpio
+      - marvell,mmp-gpio
+      - marvell,mmp2-gpio
+      - marvell,pxa93x-gpio
+      - marvell,pxa1928-gpio
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  ranges: true
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 1
+
+  gpio-controller: true
+
+  '#gpio-cells':
+    const: 2
+
+  gpio-ranges:
+    maxItems: 1
+
+  interrupts: true
+
+  interrupt-names: true
+
+  interrupt-controller: true
+
+  '#interrupt-cells':
+    const: 2
+
+patternProperties:
+  '^gpio@[0-9a-f]*$':
+    type: object
+    properties:
+      reg:
+        maxItems: 1
+
+    required:
+      - reg
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - '#address-cells'
+  - '#size-cells'
+  - reg
+  - gpio-controller
+  - '#gpio-cells'
+  - interrupts
+  - interrupt-names
+  - interrupt-controller
+  - '#interrupt-cells'
+  - ranges
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/pxa-clock.h>
+    gpio@40e00000 {
+        compatible = "intel,pxa3xx-gpio";
+        #address-cells = <1>;
+        #size-cells = <1>;
+        reg = <0x40e00000 0x10000>;
+        gpio-controller;
+        #gpio-cells = <2>;
+        interrupts = <8>, <9>, <10>;
+        interrupt-names = "gpio0", "gpio1", "gpio_mux";
+        clocks = <&clks CLK_GPIO>;
+        interrupt-controller;
+        #interrupt-cells = <2>;
+        ranges;
+    };
+  - |
+    #include <dt-bindings/clock/marvell,pxa910.h>
+    gpio@d4019000 {
+        compatible = "marvell,mmp-gpio";
+        #address-cells = <1>;
+        #size-cells = <1>;
+        reg = <0xd4019000 0x1000>;
+        gpio-controller;
+        #gpio-cells = <2>;
+        interrupts = <49>;
+        interrupt-names = "gpio_mux";
+        clocks = <&soc_clocks PXA910_CLK_GPIO>;
+        resets = <&soc_clocks PXA910_CLK_GPIO>;
+        interrupt-controller;
+        #interrupt-cells = <2>;
+        ranges;
+
+        gpio@d4019000 {
+            reg = <0xd4019000 0x4>;
+        };
+
+        gpio@d4019004 {
+            reg = <0xd4019004 0x4>;
+        };
+
+        gpio@d4019008 {
+            reg = <0xd4019008 0x4>;
+        };
+
+        gpio@d4019100 {
+            reg = <0xd4019100 0x4>;
+        };
+     };
+
+...
-- 
2.25.1

