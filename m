Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0DA6127C55
	for <lists+linux-rtc@lfdr.de>; Thu, 23 May 2019 14:02:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729762AbfEWMCV (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 23 May 2019 08:02:21 -0400
Received: from mail1.skidata.com ([91.230.2.99]:1617 "EHLO mail1.skidata.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728309AbfEWMCV (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Thu, 23 May 2019 08:02:21 -0400
X-Greylist: delayed 427 seconds by postgrey-1.27 at vger.kernel.org; Thu, 23 May 2019 08:02:20 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=skidata.com; i=@skidata.com; q=dns/txt; s=selector1;
  t=1558612963; x=1590148963;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=TxGXbfw7z2292Z6hKFmKjnZyC5PGKjytRrBvM3a9feQ=;
  b=mEoSrR4RWwIu4bsbpPQ4NtwhW0u67Y/BvGwkFAc1TnR3nKQqKiX8gmrB
   TgETUNeeX9SArl5AbjCAR+QFDr5na3krjVyTfp1AncRtqKqngSTYCMZ4G
   YeZn5T/wAkky6w57JuCM/8bRR+C7ybIIOI9AuFMZEE9YjvN92kgXS5ImH
   RbaN54acBmWcpqd49tcnvEpoThiG8uUDkCSiAGu4vpSGr1/CLCQ5x22Xs
   hcVVBo8UfS6dMrf4k2ADZlxkq4fXPSUMysjAXgKnqIIOhR3mZPkSCNHzW
   T8ZIbGmZCvt62g2VZoS/CD5+EIpR5VjLy+m10FJw4+xvkE+NQGoe+4QHv
   Q==;
IronPort-SDR: GjI7Wes/nu3epiSwuwoBb18m62MUi8Drc+pJORFAZtrYEVK2dKGSpaQiVfpPRFGjy5wcXFZv92
 kXG/fb+i9bLeLdx45nz9l2c8dT7vP9BadkL30Vobliv5RBIxoVBn191Vqq4WpWw+USLu4TJjwH
 5xLc1AdtrCLikmBuT8Upc2RpsM8neeiwVAw+cUtmfYrBfq4ooum9ujYe80Au5Llf8Ku2y9yJyL
 qFr6j9IgqO8dmk+8X30CyYoV9PBNf7Hdsm97FMHDD0h5LSbVeK7d+s9nt8q7droksQ0DMI3T4e
 ECw=
X-IronPort-AV: E=Sophos;i="5.60,502,1549926000"; 
   d="scan'208";a="17248255"
From:   Richard Leitner <richard.leitner@skidata.com>
To:     <a.zummo@towertech.it>, <alexandre.belloni@bootlin.com>
CC:     <linux-rtc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Richard Leitner <richard.leitner@skidata.com>
Subject: [PATCH v2 0/4] rtc: s35390a: uie_unsupported and minor fixes
Date:   Thu, 23 May 2019 13:54:47 +0200
Message-ID: <20190523115451.20007-1-richard.leitner@skidata.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex4srv.skidata.net (192.168.111.82) To
 sdex5srv.skidata.net (192.168.111.83)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

As the s35390a does only support per-minute based alarms we have to
set the uie_unsupported flag. Otherwise it delays for 10sec and 
fails afterwards with modern hwclock versions.

Furthermore some other minor changes are made.

All patches were tested on an i.MX6 platform.

CHANGES v2:
 - use BIT in "clarify INT2 pin output modes"
 - add "change FLAG defines to use BIT macro"

Richard Leitner (4):
  rtc: s35390a: clarify INT2 pin output modes
  rtc: s35390a: set uie_unsupported
  rtc: s35390a: introduce struct device in probe
  rtc: s35390a: change FLAG defines to use BIT macro

 drivers/rtc/rtc-s35390a.c | 55 +++++++++++++++++++++------------------
 1 file changed, 29 insertions(+), 26 deletions(-)

-- 
2.20.1

