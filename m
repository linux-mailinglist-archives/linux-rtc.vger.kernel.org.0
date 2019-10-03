Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 14977C9B3F
	for <lists+linux-rtc@lfdr.de>; Thu,  3 Oct 2019 11:56:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729252AbfJCJxR (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 3 Oct 2019 05:53:17 -0400
Received: from mx2.suse.de ([195.135.220.15]:37474 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729472AbfJCJwy (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Thu, 3 Oct 2019 05:52:54 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id DAE5CB163;
        Thu,  3 Oct 2019 09:52:51 +0000 (UTC)
From:   Thomas Bogendoerfer <tbogendoerfer@suse.de>
To:     Jonathan Corbet <corbet@lwn.net>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        "David S. Miller" <davem@davemloft.net>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        netdev@vger.kernel.org, linux-rtc@vger.kernel.org,
        linux-serial@vger.kernel.org
Subject: [PATCH v7 5/5] MIPS: SGI-IP27: Enable ethernet phy on second Origin 200 module
Date:   Thu,  3 Oct 2019 11:52:33 +0200
Message-Id: <20191003095235.5158-6-tbogendoerfer@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191003095235.5158-1-tbogendoerfer@suse.de>
References: <20191003095235.5158-1-tbogendoerfer@suse.de>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

PROM only enables ethernet PHY on first Origin 200 module, so we must
do it ourselves for the second module.

Signed-off-by: Thomas Bogendoerfer <tbogendoerfer@suse.de>
---
 arch/mips/pci/pci-ip27.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/mips/pci/pci-ip27.c b/arch/mips/pci/pci-ip27.c
index 441eb9383b20..7cc784cb299b 100644
--- a/arch/mips/pci/pci-ip27.c
+++ b/arch/mips/pci/pci-ip27.c
@@ -7,6 +7,11 @@
  * Copyright (C) 1999, 2000, 04 Ralf Baechle (ralf@linux-mips.org)
  * Copyright (C) 1999, 2000 Silicon Graphics, Inc.
  */
+#include <asm/sn/addrs.h>
+#include <asm/sn/types.h>
+#include <asm/sn/klconfig.h>
+#include <asm/sn/hub.h>
+#include <asm/sn/ioc3.h>
 #include <asm/pci/bridge.h>
 
 dma_addr_t __phys_to_dma(struct device *dev, phys_addr_t paddr)
@@ -31,3 +36,20 @@ int pcibus_to_node(struct pci_bus *bus)
 }
 EXPORT_SYMBOL(pcibus_to_node);
 #endif /* CONFIG_NUMA */
+
+static void ip29_fixup_phy(struct pci_dev *dev)
+{
+	int nasid = pcibus_to_node(dev->bus);
+	u32 sid;
+
+	if (nasid != 1)
+		return; /* only needed on second module */
+
+	/* enable ethernet PHY on IP29 systemboard */
+	pci_read_config_dword(dev, PCI_SUBSYSTEM_VENDOR_ID, &sid);
+	if (sid == ((PCI_VENDOR_ID_SGI << 16) | IOC3_SUBSYS_IP29_SYSBOARD))
+		REMOTE_HUB_S(nasid, MD_LED0, 0x09);
+}
+
+DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_SGI, PCI_DEVICE_ID_SGI_IOC3,
+			ip29_fixup_phy);
-- 
2.16.4

