Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4A615747AB4
	for <lists+linux-rtc@lfdr.de>; Wed,  5 Jul 2023 02:30:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230285AbjGEAap (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 4 Jul 2023 20:30:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229512AbjGEAap (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 4 Jul 2023 20:30:45 -0400
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38653EA
        for <linux-rtc@vger.kernel.org>; Tue,  4 Jul 2023 17:30:44 -0700 (PDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3650QIAr029240;
        Wed, 5 Jul 2023 00:30:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=DK/iVlFkHdpcCizkqoQ7ZjlxWPQ/giBD4RfDuqGSwGY=;
 b=TCiqqouL+qD9TzJ+bsoeZ2zNmIPigeCGOczwPsEuK+NLk6vBO2m/9nlZhohmGjxsNo0/
 4xK/9L8iiLnWlIaYKBJQntqBD229M+Wo/ICyEuEql5QT/sYDL3DtRQU/oVOCTNokhoab
 mFfw2U9BH8PK4ie0KU48I6RvvNC8njo16Yl74CguA2wuf7prPbw8rNcqbbA3PPGqM87+
 ubFXp6cRv1R7ThVjNFawwVYA+jXVJ14Fq/yFv+AMpm9DhurM3QQ87BdH3pNLaq9aLGjO
 g7De+mLT4h06m/2OeTly6TfomTUqJgtq5Nue7pqtNCeJUCNERc6vSl2HpZhnkYUXRo6C pQ== 
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com [159.122.73.72])
        by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rmwyjg2ab-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 05 Jul 2023 00:30:39 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
        by ppma06fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 364NSIl4019974;
        Wed, 5 Jul 2023 00:30:37 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
        by ppma06fra.de.ibm.com (PPS) with ESMTPS id 3rjbddspev-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 05 Jul 2023 00:30:37 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
        by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3650UZKv48103714
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 5 Jul 2023 00:30:35 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 0E85920040;
        Wed,  5 Jul 2023 00:30:35 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 8ADEE20049;
        Wed,  5 Jul 2023 00:30:34 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
        by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
        Wed,  5 Jul 2023 00:30:34 +0000 (GMT)
Received: from bgray-lenovo-p15.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 6A1CD60142;
        Wed,  5 Jul 2023 10:30:30 +1000 (AEST)
From:   Benjamin Gray <bgray@linux.ibm.com>
To:     linux-rtc@vger.kernel.org
Cc:     linuxppc-dev@lists.ozlabs.org, Benjamin Gray <bgray@linux.ibm.com>
Subject: [PATCH] rtc: Kconfig: select REGMAP for RTC_DRV_DS1307
Date:   Wed,  5 Jul 2023 10:30:24 +1000
Message-ID: <20230705003024.1486757-1-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: _GGuUBYf2y57M1hhAYBaJwQe8CrT3y0e
X-Proofpoint-ORIG-GUID: _GGuUBYf2y57M1hhAYBaJwQe8CrT3y0e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-04_16,2023-07-04_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 malwarescore=0
 mlxlogscore=999 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 mlxscore=0 spamscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2305260000
 definitions=main-2307040214
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The drivers/rtc/rtc-ds1307.c driver has a direct dependency on
struct regmap_config, which is guarded behind CONFIG_REGMAP.

Commit 70a640c0efa7 ("regmap: REGMAP_KUNIT should not select REGMAP")
exposed this by disabling the default pick unless KUNIT_ALL_TESTS is
set, causing the ppc64be allnoconfig build to fail.

Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>
---
 drivers/rtc/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index ffca9a8bb878..7455ebd189fe 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -246,6 +246,7 @@ config RTC_DRV_AS3722
 
 config RTC_DRV_DS1307
 	tristate "Dallas/Maxim DS1307/37/38/39/40/41, ST M41T00, EPSON RX-8025, ISL12057"
+	select REGMAP
 	select REGMAP_I2C
 	select WATCHDOG_CORE if WATCHDOG
 	help
-- 
2.41.0

