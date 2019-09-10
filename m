Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BB17CAE8B3
	for <lists+linux-rtc@lfdr.de>; Tue, 10 Sep 2019 12:53:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390045AbfIJKxf (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 10 Sep 2019 06:53:35 -0400
Received: from inva020.nxp.com ([92.121.34.13]:60162 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731800AbfIJKxf (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Tue, 10 Sep 2019 06:53:35 -0400
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id BCAD01A0955;
        Tue, 10 Sep 2019 12:53:31 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id C24C21A01D1;
        Tue, 10 Sep 2019 12:53:26 +0200 (CEST)
Received: from titan.ap.freescale.net (TITAN.ap.freescale.net [10.192.208.233])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id C6CD4402CF;
        Tue, 10 Sep 2019 18:53:20 +0800 (SGT)
From:   Biwen Li <biwen.li@nxp.com>
To:     a.zummo@towertech.it, alexandre.belloni@bootlin.com,
        robh+dt@kernel.org, mark.rutland@arm.com, leoyang.li@nxp.com
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Biwen Li <biwen.li@nxp.com>,
        Martin Fuzzey <mfuzzey@parkeon.com>
Subject: [v4,2/2] rtc: pcf85263/pcf85363: support PM, wakeup device, improve performance
Date:   Tue, 10 Sep 2019 18:42:47 +0800
Message-Id: <20190910104247.13142-2-biwen.li@nxp.com>
X-Mailer: git-send-email 2.9.5
In-Reply-To: <20190910104247.13142-1-biwen.li@nxp.com>
References: <20190910104247.13142-1-biwen.li@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Add some features as follow:
    - Set quartz oscillator load capacitance by DT
      (generate more accuracy frequency)
    - Set quartz oscillator drive control by DT
      (reduce/increase the current consumption)
    - Set low jitter mode by DT
      (improve jitter performance)
    - Set wakeup source by DT
      (wakeup device from suspend
    - Select interrupt output pin by DT
      (INTA/TS(INTB))
    - Select interrupt type by DT
    - Add power management
    - Add ioctl to check rtc status
      (check whether oscillator of pcf85263/pcf85363 is stopped)

Datasheet url:
    - https://www.nxp.com/docs/en/data-sheet/PCF85263A.pdf
    - https://www.nxp.com/docs/en/data-sheet/PCF85363A.pdf

Signed-off-by: Martin Fuzzey <mfuzzey@parkeon.com>
Signed-off-by: Biwen Li <biwen.li@nxp.com>
---
Change in v4:
	- Add nxp,rtc-interrupt-type property
	- Interrupt output pin Cooperate with interrupt type

Change in v3:
	- Fix compilation error

Change in v2:
	- Replace properties name
	  quartz-load-capacitance -> quartz-load-femtofarads
	  quartz-drive-strength -> nxp,quartz-drive-strength
	  quartz-low-jitter -> nxp,quartz-low-jitter
	- Set default interrupt-output-pin as "INTA"

 drivers/rtc/rtc-pcf85363.c | 372 ++++++++++++++++++++++++++++++++++---
 1 file changed, 349 insertions(+), 23 deletions(-)

diff --git a/drivers/rtc/rtc-pcf85363.c b/drivers/rtc/rtc-pcf85363.c
index 3450d615974d..56d51aca49ec 100644
--- a/drivers/rtc/rtc-pcf85363.c
+++ b/drivers/rtc/rtc-pcf85363.c
@@ -18,6 +18,16 @@
 #include <linux/of_device.h>
 #include <linux/regmap.h>
 
+/* Quartz capacitance */
+#define PCF85363_QUARTZCAP_7pF		0
+#define PCF85363_QUARTZCAP_6pF		1
+#define PCF85363_QUARTZCAP_12p5pF	2
+
+/* Quartz drive strength */
+#define PCF85363_QUARTZDRIVE_NORMAL	0
+#define PCF85363_QUARTZDRIVE_LOW	1
+#define PCF85363_QUARTZDRIVE_HIGH	2
+
 /*
  * Date/Time registers
  */
@@ -96,10 +106,20 @@
 #define FLAGS_PIF	BIT(7)
 
 #define PIN_IO_INTAPM	GENMASK(1, 0)
-#define PIN_IO_INTA_CLK	0
-#define PIN_IO_INTA_BAT	1
-#define PIN_IO_INTA_OUT	2
-#define PIN_IO_INTA_HIZ	3
+#define PIN_IO_INTAPM_SHIFT	0
+#define PIN_IO_INTA_CLK	(0 << PIN_IO_INTAPM_SHIFT)
+#define PIN_IO_INTA_BAT	(1 << PIN_IO_INTAPM_SHIFT)
+#define PIN_IO_INTA_OUT	(2 << PIN_IO_INTAPM_SHIFT)
+#define PIN_IO_INTA_HIZ	(3 << PIN_IO_INTAPM_SHIFT)
+
+#define PIN_IO_TSPM	 GENMASK(3, 2)
+#define PIN_IO_TSPM_SHIFT	2
+#define PIN_IO_TS_DISABLE	(0x0 << PIN_IO_TSPM_SHIFT)
+#define PIN_IO_TS_INTB_OUT	(0x1 << PIN_IO_TSPM_SHIFT)
+#define PIN_IO_TS_CLK_OUT	(0x2 << PIN_IO_TSPM_SHIFT)
+#define PIN_IO_TS_IN	(0x3 << PIN_IO_TSPM_SHIFT)
+
+#define PIN_IO_CLKPM	BIT(7) /* 0 = enable CLK pin,1 = disable CLK pin */
 
 #define STOP_EN_STOP	BIT(0)
 
@@ -107,9 +127,35 @@
 
 #define NVRAM_SIZE	0x40
 
+#define DT_SECS_OS BIT(7)
+
+#define CTRL_OSCILLATOR_CL_MASK	GENMASK(1, 0)
+#define CTRL_OSCILLATOR_CL_SHIFT	0
+#define CTRL_OSCILLATOR_OSCD_MASK	GENMASK(3, 2)
+#define CTRL_OSCILLATOR_OSCD_SHIFT	2
+#define CTRL_OSCILLATOR_LOWJ		BIT(4)
+
+#define CTRL_FUNCTION_COF_OFF	0x7 /* No clock output */
+
+enum pcf85363_irqpin {
+	IRQPIN_INTA,
+	IRQPIN_INTB,
+	IRQPIN_MAX,
+};
+
+static const char *const pcf85363_irqpin_names[] = {
+	[IRQPIN_INTA] = "INTA",
+	[IRQPIN_INTB] = "INTB",
+	[IRQPIN_MAX] = "",
+};
+
+
 struct pcf85363 {
+	struct device *dev;
 	struct rtc_device	*rtc;
 	struct regmap		*regmap;
+	int irq;
+	u8 irq_type[IRQPIN_MAX];
 };
 
 struct pcf85x63_config {
@@ -205,26 +251,60 @@ static int pcf85363_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alrm)
 	return 0;
 }
 
-static int _pcf85363_rtc_alarm_irq_enable(struct pcf85363 *pcf85363, unsigned
-					  int enabled)
+static int _pcf85363_rtc_alarm_irq_enable(struct pcf85363 *pcf85363,
+					  unsigned int enabled,
+					  int irq_pin)
 {
-	unsigned int alarm_flags = ALRM_SEC_A1E | ALRM_MIN_A1E | ALRM_HR_A1E |
+	unsigned int alarm1_flags = ALRM_SEC_A1E | ALRM_MIN_A1E | ALRM_HR_A1E |
 				   ALRM_DAY_A1E | ALRM_MON_A1E;
-	int ret;
+	unsigned int alarm2_flags = ALRM_MIN_A2E | ALRM_HR_A2E | ALRM_DAY_A2E;
+	unsigned int alarm_flags = 0;
+	int ret, reg;
+	u8 reg_val = 0, ctrl_flags = FLAGS_A1F;
+
+	if (pcf85363->irq_type[irq_pin] & INT_A1IE) {
+		alarm_flags = alarm1_flags;
+		ctrl_flags = FLAGS_A1F;
+	}
 
+	if (pcf85363->irq_type[irq_pin] & INT_A2IE) {
+		alarm_flags |= alarm2_flags;
+		ctrl_flags |= FLAGS_A2F;
+	}
 	ret = regmap_update_bits(pcf85363->regmap, DT_ALARM_EN, alarm_flags,
 				 enabled ? alarm_flags : 0);
 	if (ret)
 		return ret;
 
-	ret = regmap_update_bits(pcf85363->regmap, CTRL_INTA_EN,
-				 INT_A1IE, enabled ? INT_A1IE : 0);
-
-	if (ret || enabled)
+	reg = CTRL_INTA_EN;
+	reg_val = INT_A1IE;
+	if (pcf85363->irq_type[irq_pin]) {
+		switch (irq_pin) {
+		case IRQPIN_INTA:
+			reg = CTRL_INTA_EN;
+			reg_val = pcf85363->irq_type[irq_pin] &
+				  (INT_A1IE | INT_A2IE);
+			break;
+
+		case IRQPIN_INTB:
+			reg = CTRL_INTB_EN;
+			reg_val = pcf85363->irq_type[irq_pin] &
+				  (INT_A1IE | INT_A2IE);
+			break;
+
+		default:
+			dev_err(pcf85363->dev, "Failed to enable some \
+				interrupts on some interrupt output pins\n");
+			return -EINVAL;
+		}
+	}
+	ret = regmap_update_bits(pcf85363->regmap, reg,
+				 reg_val, enabled ? reg_val : 0);
+	if (ret || !enabled)
 		return ret;
 
 	/* clear current flags */
-	return regmap_update_bits(pcf85363->regmap, CTRL_FLAGS, FLAGS_A1F, 0);
+	return regmap_update_bits(pcf85363->regmap, CTRL_FLAGS, ctrl_flags, 0);
 }
 
 static int pcf85363_rtc_alarm_irq_enable(struct device *dev,
@@ -232,7 +312,7 @@ static int pcf85363_rtc_alarm_irq_enable(struct device *dev,
 {
 	struct pcf85363 *pcf85363 = dev_get_drvdata(dev);
 
-	return _pcf85363_rtc_alarm_irq_enable(pcf85363, enabled);
+	return _pcf85363_rtc_alarm_irq_enable(pcf85363, enabled, IRQPIN_INTA);
 }
 
 static int pcf85363_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alrm)
@@ -251,7 +331,7 @@ static int pcf85363_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alrm)
 	 * Disable the alarm interrupt before changing the value to avoid
 	 * spurious interrupts
 	 */
-	ret = _pcf85363_rtc_alarm_irq_enable(pcf85363, 0);
+	ret = _pcf85363_rtc_alarm_irq_enable(pcf85363, 0, IRQPIN_INTA);
 	if (ret)
 		return ret;
 
@@ -260,7 +340,9 @@ static int pcf85363_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alrm)
 	if (ret)
 		return ret;
 
-	return _pcf85363_rtc_alarm_irq_enable(pcf85363, alrm->enabled);
+	return _pcf85363_rtc_alarm_irq_enable(pcf85363,
+					      alrm->enabled,
+					      IRQPIN_INTA);
 }
 
 static irqreturn_t pcf85363_rtc_handle_irq(int irq, void *dev_id)
@@ -282,12 +364,55 @@ static irqreturn_t pcf85363_rtc_handle_irq(int irq, void *dev_id)
 	return IRQ_NONE;
 }
 
+static int pcf85363_osc_is_stopped(struct pcf85363 *pcf85363)
+{
+	unsigned int regval;
+	int ret;
+
+	ret = regmap_read(pcf85363->regmap, DT_SECS, &regval);
+	if (ret)
+		return ret;
+
+	ret = regval & DT_SECS_OS ? 1 : 0;
+	if (ret)
+		dev_warn(pcf85363->dev, "Oscillator stop detected, date/time is not reliable.\n");
+
+	return ret;
+}
+
+static int pcf85363_ioctl(struct device *dev,
+			  unsigned int cmd, unsigned long arg)
+{
+	struct pcf85363 *pcf85363 = dev_get_drvdata(dev);
+	int ret;
+
+	switch (cmd) {
+	case RTC_VL_READ:
+		ret = pcf85363_osc_is_stopped(pcf85363);
+		if (ret < 0)
+			return ret;
+
+		if (copy_to_user((void __user *)arg, &ret, sizeof(int)))
+			return -EFAULT;
+		return 0;
+
+	case RTC_VL_CLR:
+		return regmap_update_bits(pcf85363->regmap,
+					  DT_SECS,
+					  DT_SECS_OS, 0);
+	default:
+		return -ENOIOCTLCMD;
+	}
+}
+
 static const struct rtc_class_ops rtc_ops = {
+	.ioctl = pcf85363_ioctl,
 	.read_time	= pcf85363_rtc_read_time,
 	.set_time	= pcf85363_rtc_set_time,
 };
 
 static const struct rtc_class_ops rtc_ops_alarm = {
+	.ioctl = pcf85363_ioctl,
 	.read_time	= pcf85363_rtc_read_time,
 	.set_time	= pcf85363_rtc_set_time,
 	.read_alarm	= pcf85363_rtc_read_alarm,
@@ -355,6 +480,155 @@ static const struct pcf85x63_config pcf_85363_config = {
 	.num_nvram = 2
 };
 
+/*
+ * On some boards the interrupt line may not be wired to the CPU but only to
+ * a power supply circuit.
+ * In that case no interrupt will be specified in the device tree but the
+ * wakeup-source DT property may be used to enable wakeup programming in
+ * sysfs
+ */
+static bool pcf85363_can_wakeup_machine(struct pcf85363 *pcf85363)
+{
+	return pcf85363->irq ||
+		of_property_read_bool(pcf85363->dev->of_node, "wakeup-source");
+}
+
+static int pcf85363_init_hw(struct pcf85363 *pcf85363)
+{
+	struct device_node *np = pcf85363->dev->of_node;
+	unsigned int regval = 0;
+	u32 propval;
+	int i, ret;
+
+	/* Determine if oscilator has been stopped (probably low power) */
+	ret = pcf85363_osc_is_stopped(pcf85363);
+	if (ret < 0) {
+		/* Log here since this is the first hw access on probe */
+		dev_err(pcf85363->dev, "Unable to read register\n");
+
+		return ret;
+	}
+
+	ret = regmap_read(pcf85363->regmap, CTRL_OSCILLATOR, &regval);
+	if (ret)
+		return ret;
+
+	/* Set oscilator register */
+	propval = PCF85363_QUARTZCAP_12p5pF;
+	ret = of_property_read_u32(np, "quartz-load-femtofarads", &propval);
+	if (!ret) {
+		switch (propval) {
+		case 6000:
+			propval = PCF85363_QUARTZCAP_6pF;
+			break;
+		case 7000:
+			propval = PCF85363_QUARTZCAP_7pF;
+			break;
+		case 12500:
+			propval = PCF85363_QUARTZCAP_12p5pF;
+			break;
+		default:
+			dev_info(pcf85363->dev, "invalid quartz-load-femtofarads, \
+				use default value 12500\n");
+			break;
+		}
+	}
+	regval |= ((propval << CTRL_OSCILLATOR_CL_SHIFT)
+		    & CTRL_OSCILLATOR_CL_MASK);
+
+	propval = PCF85363_QUARTZDRIVE_NORMAL;
+	ret = of_property_read_u32(np, "nxp,quartz-drive-strength", &propval);
+	if (!ret) {
+		switch (propval) {
+		case 60:
+			propval = PCF85363_QUARTZDRIVE_LOW;
+			break;
+		case 100:
+			propval = PCF85363_QUARTZDRIVE_NORMAL;
+			break;
+		case 500:
+			propval = PCF85363_QUARTZDRIVE_HIGH;
+			break;
+		default:
+			dev_info(pcf85363->dev, "invalid nxp,quartz-drive-strength, \
+				 use default value 100\n");
+			break;
+		}
+	}
+	regval |= ((propval << CTRL_OSCILLATOR_OSCD_SHIFT)
+		    & CTRL_OSCILLATOR_OSCD_MASK);
+
+	if (of_property_read_bool(np, "nxp,quartz-low-jitter"))
+		regval |= CTRL_OSCILLATOR_LOWJ;
+
+	ret = regmap_write(pcf85363->regmap, CTRL_OSCILLATOR, regval);
+	if (ret)
+		return ret;
+
+	/* Set function register
+	 * (100th second disabled
+	 * no periodic interrupt
+	 * real-time clock mode
+	 * RTC stop is controlled by STOP bit only
+	 * no clock output)
+	 */
+	ret = regmap_write(pcf85363->regmap, CTRL_FUNCTION,
+			   CTRL_FUNCTION_COF_OFF);
+	if (ret)
+		return ret;
+
+	/* Set all interrupts to disabled, level mode */
+	ret = regmap_write(pcf85363->regmap, CTRL_INTA_EN,
+			   INT_ILP);
+	if (ret)
+		return ret;
+	ret = regmap_write(pcf85363->regmap, CTRL_INTB_EN,
+			   INT_ILP);
+	if (ret)
+		return ret;
+
+	/* Determine which interrupt pin the board uses */
+	pcf85363->irq_type[IRQPIN_INTA] = INT_A1IE;
+	pcf85363->irq_type[IRQPIN_INTB] = 0;
+	for (i = 0; i < IRQPIN_MAX; i++) {
+		const char *irq_output_pin;
+		u32 irq_type = 0;
+
+		if (pcf85363_can_wakeup_machine(pcf85363)) {
+			if (!of_property_read_string_index(pcf85363->dev->of_node,
+							   "nxp,rtc-interrupt-output-pin",
+							   i, &irq_output_pin))
+				if (!strncmp(pcf85363_irqpin_names[i],
+					     irq_output_pin,
+					     strlen(pcf85363_irqpin_names[i]))) {
+					if (!of_property_read_u32_index(pcf85363->dev->of_node,
+									"nxp,rtc-interrupt-type",
+									i, &irq_type))
+						pcf85363->irq_type[IRQPIN_INTA] = (u8)(0xff & irq_type);
+				}
+		}
+
+		/* Setup IO pin config register */
+		regval = PIN_IO_CLKPM; /* disable CLK pin*/
+		if (pcf85363->irq_type[i]) {
+			switch (i) {
+			case IRQPIN_INTA:
+				regval |= (PIN_IO_INTA_OUT | PIN_IO_TS_DISABLE);
+				break;
+			case IRQPIN_INTB:
+				regval |= (PIN_IO_INTA_HIZ | PIN_IO_TS_INTB_OUT);
+				break;
+			default:
+				dev_err(pcf85363->dev, "Failed to set interrupt out pin\n");
+				return -EINVAL;
+			}
+			ret = regmap_write(pcf85363->regmap, CTRL_PIN_IO, regval);
+		}
+	}
+	return ret;
+}
+
+
 static int pcf85363_probe(struct i2c_client *client,
 			  const struct i2c_device_id *id)
 {
@@ -394,9 +668,11 @@ static int pcf85363_probe(struct i2c_client *client,
 		return PTR_ERR(pcf85363->regmap);
 	}
 
+	pcf85363->irq = client->irq;
+	pcf85363->dev = &client->dev;
 	i2c_set_clientdata(client, pcf85363);
 
-	pcf85363->rtc = devm_rtc_allocate_device(&client->dev);
+	pcf85363->rtc = devm_rtc_allocate_device(pcf85363->dev);
 	if (IS_ERR(pcf85363->rtc))
 		return PTR_ERR(pcf85363->rtc);
 
@@ -404,20 +680,28 @@ static int pcf85363_probe(struct i2c_client *client,
 	pcf85363->rtc->range_min = RTC_TIMESTAMP_BEGIN_2000;
 	pcf85363->rtc->range_max = RTC_TIMESTAMP_END_2099;
 
-	if (client->irq > 0) {
+	ret = pcf85363_init_hw(pcf85363);
+	if (ret)
+		return ret;
+
+	if (pcf85363->irq > 0) {
 		regmap_write(pcf85363->regmap, CTRL_FLAGS, 0);
-		regmap_update_bits(pcf85363->regmap, CTRL_PIN_IO,
-				   PIN_IO_INTA_OUT, PIN_IO_INTAPM);
-		ret = devm_request_threaded_irq(&client->dev, client->irq,
+		ret = devm_request_threaded_irq(pcf85363->dev, pcf85363->irq,
 						NULL, pcf85363_rtc_handle_irq,
-						IRQF_TRIGGER_LOW | IRQF_ONESHOT,
+						IRQF_TRIGGER_FALLING |
+						IRQF_ONESHOT,
 						"pcf85363", client);
-		if (ret)
+		if (ret) {
 			dev_warn(&client->dev, "unable to request IRQ, alarms disabled\n");
+			pcf85363->irq = 0;
+		}
 		else
 			pcf85363->rtc->ops = &rtc_ops_alarm;
 	}
 
+	if (pcf85363_can_wakeup_machine(pcf85363))
+		device_init_wakeup(pcf85363->dev, true);
+
 	ret = rtc_register_device(pcf85363->rtc);
 
 	for (i = 0; i < config->num_nvram; i++) {
@@ -425,6 +709,10 @@ static int pcf85363_probe(struct i2c_client *client,
 		rtc_nvmem_register(pcf85363->rtc, &nvmem_cfg[i]);
 	}
 
+	/* We cannot support UIE mode if we do not have an IRQ line */
+	if (!pcf85363->irq)
+		pcf85363->rtc->uie_unsupported = 1;
+
 	return ret;
 }
 
@@ -435,12 +723,50 @@ static const struct of_device_id dev_ids[] = {
 };
 MODULE_DEVICE_TABLE(of, dev_ids);
 
+static int pcf85363_remove(struct i2c_client *client)
+{
+	struct pcf85363 *pcf85363 = i2c_get_clientdata(client);
+
+	if (pcf85363_can_wakeup_machine(pcf85363))
+		device_init_wakeup(pcf85363->dev, false);
+
+	return 0;
+}
+
+#ifdef CONFIG_PM_SLEEP
+static int pcf85363_suspend(struct device *dev)
+{
+	struct pcf85363 *pcf85363 = dev_get_drvdata(dev);
+	int ret = 0;
+
+	if (device_may_wakeup(dev))
+		ret = enable_irq_wake(pcf85363->irq);
+
+	return ret;
+}
+
+static int pcf85363_resume(struct device *dev)
+{
+	struct pcf85363 *pcf85363 = dev_get_drvdata(dev);
+	int ret = 0;
+
+	if (device_may_wakeup(dev))
+		ret = disable_irq_wake(pcf85363->irq);
+
+	return ret;
+}
+#endif
+
+static SIMPLE_DEV_PM_OPS(pcf85363_pm_ops, pcf85363_suspend,  pcf85363_resume);
+
 static struct i2c_driver pcf85363_driver = {
 	.driver	= {
 		.name	= "pcf85363",
 		.of_match_table = of_match_ptr(dev_ids),
+		.pm = &pcf85363_pm_ops,
 	},
 	.probe	= pcf85363_probe,
+	.remove	= pcf85363_remove,
 };
 
 module_i2c_driver(pcf85363_driver);
-- 
2.17.1

