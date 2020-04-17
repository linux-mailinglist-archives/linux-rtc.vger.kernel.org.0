Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71FD91AE331
	for <lists+linux-rtc@lfdr.de>; Fri, 17 Apr 2020 19:09:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728303AbgDQRIc (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 17 Apr 2020 13:08:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727913AbgDQRIa (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 17 Apr 2020 13:08:30 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84549C061A0C;
        Fri, 17 Apr 2020 10:08:30 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id b11so3894621wrs.6;
        Fri, 17 Apr 2020 10:08:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hmsV5eZJXnc9eG+jSXMH3ELzgDo10IgatuJIePLn5QU=;
        b=uTXlFR/gyHMZJNZ1ZHMqQT3EfnIlp46bYaRMve4QvNvjgCV3LuiqHLvsJmocbwKPIE
         ckbDmYyWizxQafxcKPWFJxIN6rLZzqVYmwmnCrnHVoXr3cItFwnoEGgoPNce3nZBfuhL
         3bMnQL7OOSJ7PjQFahvNuLSQ79Mnh6aydZ0DLwVcIVu5ON/4GqiuJ4gO0mVgZZahB6dE
         eHhJMhzCUqoJ0gHRd004jINQo2oAxx5QIoxjWAIP6wfcummsjbOiZbLaN76c9cLpkelt
         kpiDWVpwRATys8nRLmbMr4y27IcFLZNMsDmsAIPJBFbAwMPpVcoHnRCqPuPJNxlGydot
         rReA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hmsV5eZJXnc9eG+jSXMH3ELzgDo10IgatuJIePLn5QU=;
        b=uFmykK5/OFUjJ4TdWuXs+9j9661/Jwh7fNwcEn04MYvcTenkcCFEKgW7XUbypo0erX
         zUp/FqgsE1ZWO0+uQ5hrdaCZdraGQX3UEn1EMQj+fKyTa5lnsougEellrXYtrkGG49hx
         Y47vR/ED6TlGMZTaNT3RXP0xKwXrhn8ZuvtMueb1LmuAMXoaex7yxIu1ADgVzo0Of+Wh
         1TG6mSdXM/gWC/IoYhX5KJ1qOt21qZ8CFl9ui6xj7ZGO3sTL6vPIlolU928LNfkYxh8V
         GuN6n8J3+Ofk9pob5P/Ok3HZk2wxGRE7gjkSUb0cAy+nZmYAGhctlkD3PFNTjgBM3d66
         G6wg==
X-Gm-Message-State: AGi0PubjhNttKVQ6imLJnGK5DDnfzlwPEIOyglpOF/aOxoHA9bhgd+7r
        daSCTreMaRtarbO+K9vnoXs=
X-Google-Smtp-Source: APiQypKQueQT8ZMI9JnPq3z4u6/W9TbWbCpMpxaHAnhXnWaZN7grXRuqK9n2P2wUP5BPCur6rCivdQ==
X-Received: by 2002:a5d:6785:: with SMTP id v5mr4738957wru.376.1587143309289;
        Fri, 17 Apr 2020 10:08:29 -0700 (PDT)
Received: from localhost (pD9E51D62.dip0.t-ipconnect.de. [217.229.29.98])
        by smtp.gmail.com with ESMTPSA id l5sm8318280wmi.22.2020.04.17.10.08.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2020 10:08:28 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-rtc@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] dt-bindings: mfd: Document the RTC present on MAX77620
Date:   Fri, 17 Apr 2020 19:08:23 +0200
Message-Id: <20200417170825.2551367-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The RTC present on MAX77620 can be used to generate an alarm at a given
time, which in turn can be used as a wakeup source for the system if it
is properly wired up.

Document how to enable the RTC to act as a wakeup source.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../devicetree/bindings/mfd/max77620.txt          | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/max77620.txt b/Documentation/devicetree/bindings/mfd/max77620.txt
index 5a642a51d58e..f05005b0993e 100644
--- a/Documentation/devicetree/bindings/mfd/max77620.txt
+++ b/Documentation/devicetree/bindings/mfd/max77620.txt
@@ -125,6 +125,17 @@ MAX77663 supports 20, 40, 80, 160, 320, 640, 1280 and 2540 microseconds.
 			control) then, GPIO1/nRST_IO goes LOW.
 			this property is valid for max20024 only.
 
+Realtime Clock
+--------------
+The MAX77620 family of power management ICs contain a realtime clock block
+that can be used to keep track of time even when the system is powered off.
+
+The realtime clock can also be programmed to trigger alerts, which can be
+used to wake the system up from sleep. In order to configure the RTC to act
+as a wakeup source, add an "rtc" child node and add the "wakeup-source"
+property.
+
+
 For DT binding details of different sub modules like GPIO, pincontrol,
 regulator, power, please refer respective device-tree binding document
 under their respective sub-system directories.
@@ -159,4 +170,8 @@ max77620@3c {
 			maxim,fps-event-source = <MAX77620_FPS_EVENT_SRC_SW>;
 		};
 	};
+
+	rtc {
+		wakeup-source;
+	};
 };
-- 
2.24.1

