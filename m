Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0F504304C2
	for <lists+linux-rtc@lfdr.de>; Sat, 16 Oct 2021 21:21:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240974AbhJPTYB (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 16 Oct 2021 15:24:01 -0400
Received: from esa1.mentor.iphmx.com ([68.232.129.153]:31272 "EHLO
        esa1.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240918AbhJPTX4 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 16 Oct 2021 15:23:56 -0400
IronPort-SDR: lXBMnDrDd+/qU0IdNV8PdkYJsSgDF7gZjw/QHaV6kzG/kUXsrWjNJTFhwKkDNTmSfGsTyMfYlJ
 NC+3N7CIUrWGvPsZVfswlP9OIXWduw5FGob3KwQvBmHZ5MkwQ4N8AEJ3lm1d9a7p1c5Jf6A58A
 Rwu0sWt+27xSA3L/EeK+rh/osAT46/eArtB0TM0S2kPDS/lYBXs3GJmI8pANo5GkOIxUWniR72
 tYOhiTO0lgFYgVguhKcZFSsasZugPJSKbSapWkJ9KKYFyeOxCeXn+XSZ4sz+Z0O8D7cSN/GrYX
 jfVcAXnTcdGSICIpxwugi1jR
X-IronPort-AV: E=Sophos;i="5.85,378,1624348800"; 
   d="scan'208";a="69743826"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa1.mentor.iphmx.com with ESMTP; 16 Oct 2021 11:21:47 -0800
IronPort-SDR: BERo3jtZzz3mTF5NKJyWfz/QtnNo3JhJEvZiGvHqoA4TkFVagekdGSipsc0pnR3+9jvdFm92V2
 1A4mdJDt9eRWQLQ9b/d+ul0xZQvV0lKmvdQ+JApbreflSiNcJ6BWcnaZF5aGU9FVyxfHF7sxZo
 IBoM89H0WdRO2A8BF4OJWw6WZQRRJqtPjKHU2A0MPASJeXZFKdXn9OGA8NGkX4u5xowx1d2hsb
 xBPENuO0DdOGU1BPIIA4XzQvcbk+HFamKyfA5ONVXR/ABAgGjF3V5uFykTi2wynNLlXsqiVBZs
 xj0=
From:   Alexey Firago <alexey_firago@mentor.com>
To:     <a.zummo@towertech.it>, <alexandre.belloni@bootlin.com>,
        <robh+dt@kernel.org>
CC:     <linux-rtc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Alexey Firago <alexey_firago@mentor.com>
Subject: [PATCH 2/2] dt-bindings: rtc: Add Maxim Integrated MAX31343
Date:   Sat, 16 Oct 2021 22:21:18 +0300
Message-ID: <20211016192118.255624-3-alexey_firago@mentor.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211016192118.255624-1-alexey_firago@mentor.com>
References: <20211016192118.255624-1-alexey_firago@mentor.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: SVR-IES-MBX-04.mgc.mentorg.com (139.181.222.4) To
 SVR-IES-MBX-04.mgc.mentorg.com (139.181.222.4)
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

It is supported by the rtc-max31343 module.

Signed-off-by: Alexey Firago <alexey_firago@mentor.com>
---
 Documentation/devicetree/bindings/rtc/trivial-rtc.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml b/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
index 13925bb78ec7..d3b2be4ad16e 100644
--- a/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
@@ -45,6 +45,8 @@ properties:
       - isil,isl1218
       # Intersil ISL12022 Real-time Clock
       - isil,isl12022
+      # Maxim MAX31343 Low Power RTC with Battery Backed SRAM
+      - maxim,max31343
       # Real Time Clock Module with I2C-Bus
       - microcrystal,rv3028
       # Real Time Clock Module with I2C-Bus
-- 
2.25.1

