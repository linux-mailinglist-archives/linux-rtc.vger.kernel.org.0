Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F4874D431C
	for <lists+linux-rtc@lfdr.de>; Thu, 10 Mar 2022 10:07:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240641AbiCJJHr (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 10 Mar 2022 04:07:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240621AbiCJJHq (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 10 Mar 2022 04:07:46 -0500
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6D09138588;
        Thu, 10 Mar 2022 01:06:44 -0800 (PST)
Received: from quad ([82.142.8.122]) by mrelayeu.kundenserver.de (mreue109
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1M9npT-1nXRKb378X-005nBf; Thu, 10
 Mar 2022 10:00:52 +0100
From:   Laurent Vivier <laurent@vivier.eu>
To:     linux-kernel@vger.kernel.org
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        linux-rtc@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-m68k@lists.linux-m68k.org,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        John Stultz <john.stultz@linaro.org>,
        Laurent Vivier <laurent@vivier.eu>, stable@vger.kernel.org
Subject: [PATCH v15 2/5] tty: goldfish: introduce gf_ioread32()/gf_iowrite32()
Date:   Thu, 10 Mar 2022 10:00:45 +0100
Message-Id: <20220310090048.1933020-3-laurent@vivier.eu>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220310090048.1933020-1-laurent@vivier.eu>
References: <20220310090048.1933020-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:z6VvWaMgbVWgHGjT5VEVpvMDtRYjzT4gaVfuJs+Sr1bSIuiz2j0
 tW3g8E/iSgn9b2ivVYHbbsXO6b/Bz7x+w91vgPBTmjRb+25hoxnRK78xGN80BD3wi83Kuj+
 60/c9jw86yLddUGQXsIcUPJcJbQxHYTUr1HOps4Mw6yFMV/NLMCJTr3/Qt0VxmYV3KJD8nu
 xz9aBxCNCbMoC/MNt9SoA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:bAk46WjY1/c=:8nu3NroU6bDNMJuRnyjolE
 7ewStpnvXrFIOAG9eOmlswTuEsO7Vu7HidhvSk9nqcOoDlk6E2WNx50ZUzCY+NBi2E1trBQV+
 FYk1uQet6HusLh4/wtBNchxdHjgQitLOpfm12pxgD2T3Hg5Nw/ZiHxHwtG1D+tP4tHCJZlLId
 RMyThOvSlG2fqTMUAMOeEPt5rQXBoYy8HAwWTuWNXD0ZJjTwgj3//ORL89vu8l7OeHLWE5Vew
 WE+1LS5uE3wjBUA6DFirnNvJCYJU7AUAufVMwG61+k4pPiW13+QuYfGdg5mj3AtFPkVwbu2J+
 VOzXp5Ugi+IVOPi9LnKa+7GnC9GiSGTehx3RfH2Uk0WVCqIBWS6fLaHKR2WNEdNRJDscbzfPX
 T4uEA+zLgCvc42NfoS8SeVfhLIsU3DYCYAE2kMeWcZHoMkWuE31JuObnmxCIePcrTMd1wxbnr
 PiTipDSBNfs8Mb7PoX8GuYsdhw4MRUZnAjIzqRhYnewFcWiFq+5cjfiSp+rjlP3w6OcJRXa0I
 D46G9J8hXxNYlWzHOj9kGokCH5RppHiSPVZNtw9LiXp/meZc25bj64W92iNvVcISaBf9PlqVd
 DcRt7yOVDE4hTbNBp+2nLUFYThD1ORTD381WPmApulPtbyKwpuArMrewkAhztz0q3Zg8ReBmE
 JhWWnmlNgsor/6aTF2VSxLgqcZYmfADHMIHzXKyokZj5TNzQWuWfeg9gLbYtvaIwS0Rg=
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_MSPIKE_H5,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Revert
commit da31de35cd2f ("tty: goldfish: use __raw_writel()/__raw_readl()")

and define gf_ioread32()/gf_iowrite32() to be able to use accessors
defined by the architecture.

Cc: stable@vger.kernel.org # v5.11+
Fixes: da31de35cd2f ("tty: goldfish: use __raw_writel()/__raw_readl()")
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 drivers/tty/goldfish.c   | 20 ++++++++++----------
 include/linux/goldfish.h | 15 +++++++++++----
 2 files changed, 21 insertions(+), 14 deletions(-)

diff --git a/drivers/tty/goldfish.c b/drivers/tty/goldfish.c
index 5ed19a9857ad..10c13b93ed52 100644
--- a/drivers/tty/goldfish.c
+++ b/drivers/tty/goldfish.c
@@ -61,13 +61,13 @@ static void do_rw_io(struct goldfish_tty *qtty,
 	spin_lock_irqsave(&qtty->lock, irq_flags);
 	gf_write_ptr((void *)address, base + GOLDFISH_TTY_REG_DATA_PTR,
 		     base + GOLDFISH_TTY_REG_DATA_PTR_HIGH);
-	__raw_writel(count, base + GOLDFISH_TTY_REG_DATA_LEN);
+	gf_iowrite32(count, base + GOLDFISH_TTY_REG_DATA_LEN);
 
 	if (is_write)
-		__raw_writel(GOLDFISH_TTY_CMD_WRITE_BUFFER,
+		gf_iowrite32(GOLDFISH_TTY_CMD_WRITE_BUFFER,
 		       base + GOLDFISH_TTY_REG_CMD);
 	else
-		__raw_writel(GOLDFISH_TTY_CMD_READ_BUFFER,
+		gf_iowrite32(GOLDFISH_TTY_CMD_READ_BUFFER,
 		       base + GOLDFISH_TTY_REG_CMD);
 
 	spin_unlock_irqrestore(&qtty->lock, irq_flags);
@@ -142,7 +142,7 @@ static irqreturn_t goldfish_tty_interrupt(int irq, void *dev_id)
 	unsigned char *buf;
 	u32 count;
 
-	count = __raw_readl(base + GOLDFISH_TTY_REG_BYTES_READY);
+	count = gf_ioread32(base + GOLDFISH_TTY_REG_BYTES_READY);
 	if (count == 0)
 		return IRQ_NONE;
 
@@ -159,7 +159,7 @@ static int goldfish_tty_activate(struct tty_port *port, struct tty_struct *tty)
 {
 	struct goldfish_tty *qtty = container_of(port, struct goldfish_tty,
 									port);
-	__raw_writel(GOLDFISH_TTY_CMD_INT_ENABLE, qtty->base + GOLDFISH_TTY_REG_CMD);
+	gf_iowrite32(GOLDFISH_TTY_CMD_INT_ENABLE, qtty->base + GOLDFISH_TTY_REG_CMD);
 	return 0;
 }
 
@@ -167,7 +167,7 @@ static void goldfish_tty_shutdown(struct tty_port *port)
 {
 	struct goldfish_tty *qtty = container_of(port, struct goldfish_tty,
 									port);
-	__raw_writel(GOLDFISH_TTY_CMD_INT_DISABLE, qtty->base + GOLDFISH_TTY_REG_CMD);
+	gf_iowrite32(GOLDFISH_TTY_CMD_INT_DISABLE, qtty->base + GOLDFISH_TTY_REG_CMD);
 }
 
 static int goldfish_tty_open(struct tty_struct *tty, struct file *filp)
@@ -202,7 +202,7 @@ static unsigned int goldfish_tty_chars_in_buffer(struct tty_struct *tty)
 {
 	struct goldfish_tty *qtty = &goldfish_ttys[tty->index];
 	void __iomem *base = qtty->base;
-	return __raw_readl(base + GOLDFISH_TTY_REG_BYTES_READY);
+	return gf_ioread32(base + GOLDFISH_TTY_REG_BYTES_READY);
 }
 
 static void goldfish_tty_console_write(struct console *co, const char *b,
@@ -355,7 +355,7 @@ static int goldfish_tty_probe(struct platform_device *pdev)
 	 * on Ranchu emulator (qemu2) returns 1 here and
 	 * driver will use physical addresses.
 	 */
-	qtty->version = __raw_readl(base + GOLDFISH_TTY_REG_VERSION);
+	qtty->version = gf_ioread32(base + GOLDFISH_TTY_REG_VERSION);
 
 	/*
 	 * Goldfish TTY device on Ranchu emulator (qemu2)
@@ -374,7 +374,7 @@ static int goldfish_tty_probe(struct platform_device *pdev)
 		}
 	}
 
-	__raw_writel(GOLDFISH_TTY_CMD_INT_DISABLE, base + GOLDFISH_TTY_REG_CMD);
+	gf_iowrite32(GOLDFISH_TTY_CMD_INT_DISABLE, base + GOLDFISH_TTY_REG_CMD);
 
 	ret = request_irq(irq, goldfish_tty_interrupt, IRQF_SHARED,
 			  "goldfish_tty", qtty);
@@ -436,7 +436,7 @@ static int goldfish_tty_remove(struct platform_device *pdev)
 #ifdef CONFIG_GOLDFISH_TTY_EARLY_CONSOLE
 static void gf_early_console_putchar(struct uart_port *port, int ch)
 {
-	__raw_writel(ch, port->membase);
+	gf_iowrite32(ch, port->membase);
 }
 
 static void gf_early_write(struct console *con, const char *s, unsigned int n)
diff --git a/include/linux/goldfish.h b/include/linux/goldfish.h
index 12be1601fd84..bcc17f95b906 100644
--- a/include/linux/goldfish.h
+++ b/include/linux/goldfish.h
@@ -8,14 +8,21 @@
 
 /* Helpers for Goldfish virtual platform */
 
+#ifndef gf_ioread32
+#define gf_ioread32 ioread32
+#endif
+#ifndef gf_iowrite32
+#define gf_iowrite32 iowrite32
+#endif
+
 static inline void gf_write_ptr(const void *ptr, void __iomem *portl,
 				void __iomem *porth)
 {
 	const unsigned long addr = (unsigned long)ptr;
 
-	__raw_writel(lower_32_bits(addr), portl);
+	gf_iowrite32(lower_32_bits(addr), portl);
 #ifdef CONFIG_64BIT
-	__raw_writel(upper_32_bits(addr), porth);
+	gf_iowrite32(upper_32_bits(addr), porth);
 #endif
 }
 
@@ -23,9 +30,9 @@ static inline void gf_write_dma_addr(const dma_addr_t addr,
 				     void __iomem *portl,
 				     void __iomem *porth)
 {
-	__raw_writel(lower_32_bits(addr), portl);
+	gf_iowrite32(lower_32_bits(addr), portl);
 #ifdef CONFIG_ARCH_DMA_ADDR_T_64BIT
-	__raw_writel(upper_32_bits(addr), porth);
+	gf_iowrite32(upper_32_bits(addr), porth);
 #endif
 }
 
-- 
2.35.1

