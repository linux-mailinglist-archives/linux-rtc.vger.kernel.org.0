Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACB0442A1B2
	for <lists+linux-rtc@lfdr.de>; Tue, 12 Oct 2021 12:11:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235808AbhJLKNM (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 12 Oct 2021 06:13:12 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:27384 "EHLO
        mx0b-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235437AbhJLKNK (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 12 Oct 2021 06:13:10 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19C9jVgD012464;
        Tue, 12 Oct 2021 10:11:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=TbXX2++TEqUyzXvyFmjrNFXgV41SrjkgR3/uFzpOICQ=;
 b=T38rj5eZed5KlNmzse5OLpJfJgN8AVkzHqGhWpU0rUbl8g83N1eIskdPzwhUf6qdgTw1
 inxEJivFhDCAL2iIZgHtsYUcW4IKm+qn75CvVvfD9V4zZmxHDc92N6TIqGUhP6+Q5cRV
 uyFLUGqu7N0V2b+XabMEp2YCuaJ3FfB7Bl1CcTmxS3BxAH//zYkCnRbsFGkunQs3w0gI
 VH1yK5ifL35Jn/xo8mdIVpLXkbqkz92Am/MNejSBUlgpL9yoUXDBMWVoreU2VoWA28IU
 7Ev6ca86jg3UQbsB5T2jZwj+VTKq8XvNg8Rt+WWblv1x2sJfFthkOQS1uxE4RZiyxvCh tw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by mx0b-00069f02.pphosted.com with ESMTP id 3bmq2vp7y2-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 12 Oct 2021 10:11:03 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 19CAAkAO075271;
        Tue, 12 Oct 2021 10:11:02 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2169.outbound.protection.outlook.com [104.47.56.169])
        by aserp3020.oracle.com with ESMTP id 3bmadxrcwq-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 12 Oct 2021 10:11:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZzNEPBPQBe4gxSDpIigIi57mccO0fIfbsW5hrKoHDbHOY/uFxUSeSMANGYZArzWBStYBsFLsti0C/4XbFY9y1zATi9Cf16uJnvZavixJrLKirT4VLKudmgsmttfxgBe8ASarxxqSBHuyil3UqtwYOE9hbRHmCXOo+jn3OPVwvwqQGoN93W8Ir8ntmZEsE9R5+n1+yQa9jnMww+inSTHrNy4f1U+VD09AHfFqF0S5rEBJ7xD+v4kdc1OUkGu3mfELQp6uDcEvkFHQuoyoaCRsykQBOdoV//WGEVWHwgEtdKzMrZNSP8P7/ZMfXioy9ovCiDeVrhFqJy0Uk/KaXpf+OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TbXX2++TEqUyzXvyFmjrNFXgV41SrjkgR3/uFzpOICQ=;
 b=B+V2H5VaLmYpA5EmdgjfMPOzv2EgySZiSxPLobqixN8sgk9FZhdpY06n5YsOiMiSQ08pNajXXsvBsx5W5k9VKur1mjpKX/NG3JmAKtqyq7qNKCDiR7GHnL//PNJRcM7yiVBYrAowdwQ0/jtp7qqGUjkFfATAygu4WOz79pAhgUGxCGPW7hPbY2hqMkmBYTrh2dgxAVd1f2Of5vxmw5lFShSpwjpV7qkGnZ4Px4+ZnDPnXKKls/qnMIPsOOwaQYzsCvQD2E95lKZc+wNeOvt6Jab8LB4HypeWTeXRSH3pIMdYLWl9S2favclA+fmA/2C+SoKLflFPGlCSoeHKjESftQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TbXX2++TEqUyzXvyFmjrNFXgV41SrjkgR3/uFzpOICQ=;
 b=z2AalJSloIg1Cd4i2xKN1/zqIG9wBfViV2MZjCe3YYvcE2PFoQdKONzKGLBbG4j3qcGbdENYRh7KDVFMzNlMRPRdFk9/2xYOeYOQ6w4fkF6hSsnVX0CFvSR7NmLw2qz0y4cXMaIdNiNNa0yZGwfGlZeK1M5QlpJlcZ4QJi2C/uQ=
Authentication-Results: towertech.it; dkim=none (message not signed)
 header.d=none;towertech.it; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR10MB1613.namprd10.prod.outlook.com
 (2603:10b6:301:a::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.19; Tue, 12 Oct
 2021 10:11:00 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9%5]) with mapi id 15.20.4587.026; Tue, 12 Oct 2021
 10:11:00 +0000
Date:   Tue, 12 Oct 2021 13:10:28 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Alessandro Zummo <a.zummo@towertech.it>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH v2] rtc: rv3032: fix error handling in
 rv3032_clkout_set_rate()
Message-ID: <20211012101028.GT2083@kadam>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JN2P275CA0037.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:2::25)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
MIME-Version: 1.0
Received: from kadam (62.8.83.99) by JN2P275CA0037.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:2::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.14 via Frontend Transport; Tue, 12 Oct 2021 10:10:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b3695509-80cd-4b96-4f6e-08d98d68973d
X-MS-TrafficTypeDiagnostic: MWHPR10MB1613:
X-Microsoft-Antispam-PRVS: <MWHPR10MB1613F23499CEDCB38E1C710B8EB69@MWHPR10MB1613.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:478;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AMFqJuAJFbKqPqtZOsxemDHpsxNdlj7CbO4t1Z7ttXifUr71t0jioqkK9X9T0Zkv0CFICrT87AQ7j2ckx5F8adKaQ+FTDyZsoN6jD8cJgrp2oUw5BNWhDZNOozwG6mhK9KAqkWqchd6+dW1HmozGmRCQeOxHG+ro57INJYpLaJqVPgOA/za6H6+wyEXi5UrgE4YFL34xkYDGN/6oLW0oFo4R0we4yfxIumoMnzwaytpiTesKC49xJ7V74JZdrRmQbxnu5UopQnuCFjpMDoHVF3pNyIt7+tAG1NKDZAC1oSUJ3ZYjfyKb37i68CjsLWrJx26K6hilIY/2t7LJ2Dp/RpcykPTqdSpm/8WnGxQpYojfUWd3BOq8PSExml0sGkeDtEbCTUrL/gKwiinNkcwdzqVfW/17cZORJAXq6fyANCkD3bsYSgd+G4uasL7CKOAvUI0qqDgsuiQ1l7qZQQnJr0BH3W9MdL5mWt3QAkTI6uU0rcw2igtJidr8UooYNhtJGpKmuMEGtBZywGy5kVvp/fBVSO+wqPUx//1QSgbqnB/cMQtu+5yaP9sOMVjblEqytUktuvDL7NadDhF98YyTH6lG2Vl59dvsrJ2CKyOZJ4TZWSj+DoongVJyIxTzpAFxT1+1DoeRCa/mHPac1qOftVYrb6W40WM03CNcgD9Tpj/9k3jc9mtQLsLbEonkQ5qZrxemyUIyoahTgGgPhkyJcw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(38100700002)(66476007)(38350700002)(186003)(1076003)(6666004)(956004)(2906002)(508600001)(6916009)(5660300002)(83380400001)(66556008)(4326008)(33716001)(26005)(52116002)(33656002)(86362001)(316002)(55016002)(6496006)(4744005)(8676002)(9686003)(9576002)(8936002)(44832011)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7MnJWrkUJSY9BOopxLJZCiu8ISl81Plx3SqodJmQ9+13sQPCywcsNux/zL9h?=
 =?us-ascii?Q?IFm2RJ5XluLiGeS+Jwasx9oaTbv4/ec2o2KuUd1xGhRV5Oub62QbkdOkyaiq?=
 =?us-ascii?Q?MLzxfDA97xW9gMAaR3JGHe32l/s9CoSNhIN5FphGNhcWfPDCgKP+MfnuCFtw?=
 =?us-ascii?Q?iAKscHlYv0gvuSZ4GqWW0YTztkd9bF5SDW3W72+olLLOozXbzjpzeTMWll4V?=
 =?us-ascii?Q?j3r7R6nozo9p842diIfxTkEaWyNIvZRqG8rcKK0pi0ZyeZ6ijp05XO5UyrXT?=
 =?us-ascii?Q?UnqRdFb7A7QCAir376UFLmrWyFKeWAx7nTKFXghn287Votp/iH6okWY89lSW?=
 =?us-ascii?Q?tpK6l4UXbvV/WOxSus4G5KpTXahqobNbjIp2Oo1kKmvpwORzVbizvK9XTte0?=
 =?us-ascii?Q?o8RqR2Tfi3+bFid1BWQ32uCgtUpUG4OTVL+pSBJKwVpkJnLT6mHiD0kx5QCr?=
 =?us-ascii?Q?10z63HBoISvw+y+kAXbB6RZ+n2TzwK4oreERm/F/v56WZQZOT1fZZ3BQKyaj?=
 =?us-ascii?Q?O+9fQ+PEUKaZ/hkNKdDK6RPy1UXS1GVGahDWXJBxe1szAQLKX9QgV99N75wd?=
 =?us-ascii?Q?kfouc3gG7bS65R//RYaKaz1hTv6gfmTEoEvW8RpWOuHnMdR3ly5GQbUgXKiz?=
 =?us-ascii?Q?djy209wiVPNTw1rBUQLvNK+bpfiApqznyKOhrCedbeZQO95MZuQ4xalVE9rH?=
 =?us-ascii?Q?l113/b1IOTaUgpVJciGB++XtRCVqz3m1e/nsnkX4bhUg/ZY6d2E+fbuUqOgw?=
 =?us-ascii?Q?poJrmlwzAbp/FBxXIHcmEUuDfmdoQeyX27Dn+HglLe4EZkjhmxhhYQ594sEd?=
 =?us-ascii?Q?bgzxI0tVSwoTtSxLz973/KZUBlpphVagxklQ5smSsTKoAi47NLbD8A5/ASr3?=
 =?us-ascii?Q?Yah/+DAi+cAxv94eiJhqbs6YOi7LfazIcAQMDJEUhZkRfIr2ZUdq0I3Lalxw?=
 =?us-ascii?Q?Tr8HMOnah+gmzfkqAFxiwXZ3lg0LLua8MZfvgtJcEcfBdL/sh92yhWj+ohoL?=
 =?us-ascii?Q?+Fe77EjSHa2TMddVOvpV7CxN1ZVrCWOQ0/0mYc3sHkVoLmjVqezzWwRSo/7+?=
 =?us-ascii?Q?ocXg0mMKJYZfoZKBuZvmbltqkLxoeCKP65ff2FsOWZgyWIGvr3uuQXYqW5o5?=
 =?us-ascii?Q?gkaBEKQNeWnAg8nhWUfdir7BynAUCbj/2YwRbH0YejatGNqk6YKUow+l5eYb?=
 =?us-ascii?Q?unRn1xsa7/nEuaUObAi/0yxSGMX+5A908aqmt9OkN8x/uMemmbTpJmMFQkFw?=
 =?us-ascii?Q?m7RMxz3XvAgXfDsz5VXt9UkrnfKF48OujjFPQhw77DPQjxLWqTh+rYSwFB+E?=
 =?us-ascii?Q?LuaHM3AtNgv96ERPFvy1Gp6Y?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3695509-80cd-4b96-4f6e-08d98d68973d
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2021 10:11:00.7196
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7W+wBJF2+MBYsgJ+PhuSZV2ShyN4Krz5bq+8K4fu5udFaGYrWyB+XvXo/qBQG/3jqSmibmxkQQBYRvkDcADNdW80ZQo5p25KUg8TZfFzvEg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1613
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10134 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0
 suspectscore=0 mlxlogscore=999 bulkscore=0 mlxscore=0 malwarescore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110120059
X-Proofpoint-GUID: vhsPUm19hsZL_WJSAOTzNIMejhNJbRNq
X-Proofpoint-ORIG-GUID: vhsPUm19hsZL_WJSAOTzNIMejhNJbRNq
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Do not call rv3032_exit_eerd() if the enter function fails but don't
forget to call the exit when the enter succeeds.

Fixes: 2eeaa532acca ("rtc: rv3032: Add a driver for Microcrystal RV-3032")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
v2: Fix a type in the commit message

 drivers/rtc/rtc-rv3032.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-rv3032.c b/drivers/rtc/rtc-rv3032.c
index d63102d5cb1e..1b62ed2f1459 100644
--- a/drivers/rtc/rtc-rv3032.c
+++ b/drivers/rtc/rtc-rv3032.c
@@ -617,11 +617,11 @@ static int rv3032_clkout_set_rate(struct clk_hw *hw, unsigned long rate,
 
 	ret = rv3032_enter_eerd(rv3032, &eerd);
 	if (ret)
-		goto exit_eerd;
+		return ret;
 
 	ret = regmap_write(rv3032->regmap, RV3032_CLKOUT1, hfd & 0xff);
 	if (ret)
-		return ret;
+		goto exit_eerd;
 
 	ret = regmap_write(rv3032->regmap, RV3032_CLKOUT2, RV3032_CLKOUT2_OS |
 			    FIELD_PREP(RV3032_CLKOUT2_HFD_MSK, hfd >> 8));
-- 
2.20.1
