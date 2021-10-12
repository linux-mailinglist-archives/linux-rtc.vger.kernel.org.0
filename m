Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B4E3F429FBF
	for <lists+linux-rtc@lfdr.de>; Tue, 12 Oct 2021 10:26:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234501AbhJLI2Z (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 12 Oct 2021 04:28:25 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:24070 "EHLO
        mx0b-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234484AbhJLI2Y (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 12 Oct 2021 04:28:24 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19C7OxHG030335;
        Tue, 12 Oct 2021 08:26:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=XpC5Oxpv+dO24v2cXpP4xQymplwZOqxEOiIQH2KMPjs=;
 b=YBw0r/YrEv20me0uHsMt4bRHgE27oAszdd/l4QRlbv1vuyFPUb9hBWPILxq7dciZucVC
 /2YzIxGd/lRykOFkYGLwPkX5rNlUSwwrYVcgriO80szOQM7ZkIGr+R9YEy+jJ0MX6o7m
 kcnfyP0Q/UgohCDdGIH866H7KXlYnSCPa5dvLwJByrW6+HTQUS/oU1N06ax3OQxXeBcj
 1lEkQfdn1h0xcN1sj9qd1CqiIFsHklSazYKI8Ua/H7taLwUG8vBRVV1KFg5F5gEENrO2
 AKq/1TZ60goHKUo63fRoOGUvA5dImUWidp3FOLn0KQ1tMRyYa7MT8TAQ5bqm+gNN7t7V FA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by mx0b-00069f02.pphosted.com with ESMTP id 3bmv41khu4-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 12 Oct 2021 08:26:13 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 19C8F66C114045;
        Tue, 12 Oct 2021 08:26:11 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2171.outbound.protection.outlook.com [104.47.58.171])
        by userp3020.oracle.com with ESMTP id 3bkyv9r0wn-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 12 Oct 2021 08:26:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RPeAPH2kAiq2XEE1bl4XvdSTmZflt2djqDLE8ruvgO9o9LUeGcaTd9C5f4VfKSf5nIXg5Jrtf+CJ3uEF3DKQfxQ54t2V1SvflHy8jFa/MgqZhayNegJHRLZ2ekkGdUYW1XeZ4RQ4nOd8oB4VXzzh9gmwvAfXEOseYm1erqOxWbWjLKKGpng/WjRW3/W934XVj9lSJsi2ggziLV+sdsTCLAKT05S4yWdH7E8Adak9XtntQ+kd1wm5g/yqATDQo557H+FZPB9g6d4YP7sqHA0CVfT3Y1K4byBS2IsdCKrwS3pmXi17BAUqgcoPOv4I+0/gyu5SFyQpD8lrAqg3oK+nag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XpC5Oxpv+dO24v2cXpP4xQymplwZOqxEOiIQH2KMPjs=;
 b=E0VzIkQ/xI9mCX7KI5raX47n6/soE6ijyKPWfLlteop3fkzRvVMCYwzN2wHpaY1hSBLOjb3u42ouORGfw7X5VsytUXR1njLF9fsymbmSnaFjuoXh95yadsOwDzJzpsTi8v0g8FpjmnJ4Z26iWObPFoi/BS8XcKY/B2BsbgIeagVv2zn7i0n5w7sPWYuJk5WDnnrH1ZJ84HddnuseLO2tm5cuMgMUVxkpHF9V7ZB0hZY0N8vwszyc5WktRXvORae06YqzjhaoyIv3ZD1m1QSZH3REDQDMZeXOQTNf/g587Q3fuy5eT1CTgZqIpOM+cKMKPsEBj6xEZoRaYrhCa2z76Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XpC5Oxpv+dO24v2cXpP4xQymplwZOqxEOiIQH2KMPjs=;
 b=Xm3X/A6MNzcRbXvUSW8vl5SiBiHZkM102qUV9LCpHnW5Rf1WGVwkZk03PrsL3e/FJ2jHbLC3olzWWkKa1dDKWh670VyaRN8RUZXWCsVrMUXZsd1p2ruw3jJsx5rY3IT8H9hLpLrNeKX265rma+ShBE/EGKBhM9IDh9tczXQfMfk=
Authentication-Results: towertech.it; dkim=none (message not signed)
 header.d=none;towertech.it; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by CO6PR10MB5425.namprd10.prod.outlook.com
 (2603:10b6:5:35f::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.20; Tue, 12 Oct
 2021 08:26:09 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9%5]) with mapi id 15.20.4587.026; Tue, 12 Oct 2021
 08:26:09 +0000
Date:   Tue, 12 Oct 2021 11:25:48 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Alessandro Zummo <a.zummo@towertech.it>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] rtc: rv3032: fix error handling in rv3032_clkout_set_rate()
Message-ID: <20211012082548.GB31086@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: LO2P265CA0440.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:e::20) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
Received: from kili (2a02:6900:8208:1848::11d1) by LO2P265CA0440.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:e::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.21 via Frontend Transport; Tue, 12 Oct 2021 08:26:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 221e0c70-8441-4030-6941-08d98d59f132
X-MS-TrafficTypeDiagnostic: CO6PR10MB5425:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO6PR10MB5425FBF758C48CA64B0D19EB8EB69@CO6PR10MB5425.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: f5Q23/Wo/sqHeoCnoFTMJH8/ehiqECLTB1Guc/IJC4iXfXFm8P/DoyoZMFGE+sIVqVubAU6KxB3x1S+Yr+c9pLh68U9hVX04SjQu9i1+sXRJpiw0nR7UeA35ti7b666n2Xwk4FqkD9rIfdNh6BRdEpr1HZYJomubyfZgD0DaNR3GQp7kZ3UBFYmau0/8T7JbRYHhX5F0xB633B8Z2zwxLtZzCAglT9n6ZVvfbnb9JitfjZQX6I92WnL/AyEwcoYmnq+jRidDzF3cGc2XORBof/UWb/Qz6mPYzoKQ54uFXHpG1TuJaxnBd1uctpCWrGVsv6l500cmynBwakzTym26QLTUDVayQHNyK5eRTdQf2EE7FyO0EKPdMb0ihYQuwl6KKY5sC+L1lJuKIClWFTce7AwsK3LIqcCXNBh4vl7KuM4pQlokow6OvAaebxi3iBZpLd4usQ0Fkx9aLsZBcLUrvsm+HUMcC09rNjsw9WY/ZLiJv9mhmbFM6WVccegTG5OK1KgNClc2cSVxe3Yk2LE+W1lHztBUS3PMk5Wg+sd2hvIUt6zR2TH5k3QCRbQN5l09G9B+C7CNGo5ciaBcPKUa1MTMTMAhbsqmn3l3t8CJrZiIe8e1VStL5m+7QiBXd0PZpN3UtT9wHEEiq9EMkd80vQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(5660300002)(9686003)(38100700002)(508600001)(33716001)(55016002)(6666004)(316002)(186003)(6916009)(4744005)(66556008)(44832011)(2906002)(8936002)(4326008)(86362001)(83380400001)(33656002)(6496006)(66946007)(66476007)(8676002)(9576002)(1076003)(52116002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?W7O3j7EtpsRl2+mpHOE/xcuLBZkji/EAFVCrw1SD/cQ2nJVbCubiFC4EXgqZ?=
 =?us-ascii?Q?bBmL1u9Edc29v1pwTQfjEdGSw0HJCPdeT+6rEmeMJgzJieACQzGOfhcQJC8c?=
 =?us-ascii?Q?BunrmcVembRi/CNZ73PkED3VFylz+Xh4yYM42Jj3NYv+AYra3k/0KdpowTjm?=
 =?us-ascii?Q?XvEiCo4szJ2lNPo4dSwgHgilCIxrTkc9KLyjc2y0vRW0cZ6b+orkfp5dPKPj?=
 =?us-ascii?Q?j9ZpsscaDrZhn8II/xo4JQDiIHRXku5aIdCO9Fd7d6ikij3eTJZyNnDw+9w7?=
 =?us-ascii?Q?YdQhfx3X7M5SKngkE5JL4R4fxewZYx9luQNrbnlUN/4zTwMxdEMgBoCwho72?=
 =?us-ascii?Q?WX/JOQWtkiGpfKtYNaWPPLqJtjAO755sBBWBXcGZkD6FsP8m6CjV0jqNxTT+?=
 =?us-ascii?Q?4FoX4MW6PvxlT26qrJ0vdPqs4zyPKfRlyCCf6oMVW9zAQFK9eUHPKm0/T1/1?=
 =?us-ascii?Q?2ahrB8M6YD5fv/f9M7nRn6BA5Wg+YPZdTr0nDIE2Jb3QcFroMavUQzxHPA0V?=
 =?us-ascii?Q?uxp2t+LYSGsw/9epVeyKuquQSVrnfwIF7chZ3fa0g14P/IM3SyGG2ImANOfx?=
 =?us-ascii?Q?Woro/n4EQc4QnuNt+Dd1Vgq2jhmes4Q/CntE6jyP8X3YGeN14tQACWisugfp?=
 =?us-ascii?Q?MczRJ+pgs0pLEiLoah/h3XbEjiyfFoPODTuHvwhw4fIaBUZFrRx6+FqqbW6c?=
 =?us-ascii?Q?3amnc5ouadTRxPrie+UHRhiGpwNK27plIiGI4rMimjA27M1sZVVptS5IxDRE?=
 =?us-ascii?Q?5LjuaHIt2XkJzBOspTiTTiZmueq0nFdteI4dkF3J7uE3e55MW5bb1V1ekitC?=
 =?us-ascii?Q?/Bjq6RxAvV5ZGP/O8nwqB2FhRhcPZTnt02lakG9fw8W8FTJ/u62bRVDwytBz?=
 =?us-ascii?Q?0dPf2cS9uq0Mf0vKC2qjU+wKByMbcrcjO3r8mXXQ1CH61d/PU4qKzpxbO2xi?=
 =?us-ascii?Q?6NQtLQuDTInAwicgrPUHgNkWbManjyy6fCzKedvnHg28UOcB0g+bkyQltm2A?=
 =?us-ascii?Q?wbkEM3LJ/d5c70c7kOVs1z2CXlenA+vZDIO0YDRZMOBUh5ekZ7AavP4pGX8N?=
 =?us-ascii?Q?7iV6X9rGD3xp345ctuLsjIjgc9Dy3V2es3ZpCYNoVL/gJJuAdSiO5Zi94wcF?=
 =?us-ascii?Q?zYAyVBxw/ZoDReBBABGqlDfy30eW6y7ZDq6CnhG1NDxKV6PfvNuwdYPSL2G8?=
 =?us-ascii?Q?3JOrtQcIpKBeO/wtplGDS0nFUgL7tiS2bGR6jJH3Kgi7Bx7Zlzzz01HsS4To?=
 =?us-ascii?Q?ZQkJzjPAj4aOBo+3P873fnOhQ+EcoiQygpqJvYK/a8pqeYR41PHsA578rZDB?=
 =?us-ascii?Q?+TSopPWFuCif0NfKd7J5p35CRVvz890OHu0PSMC5sA6nVyisaKovkI+nrNyQ?=
 =?us-ascii?Q?nR4WfE8=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 221e0c70-8441-4030-6941-08d98d59f132
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2021 08:26:09.4150
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d4eu/jAMBEyxfNkFTbxzSTQ0M5bMsfy1KmAgL2s9l/vsnGbKxpzXBAQEsoFMeC33xyRaj+XMdLNTNbtOUk+8wxXPwlle0ouCH0CRNBIvwkU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR10MB5425
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10134 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 adultscore=0 bulkscore=0 mlxscore=0 spamscore=0 mlxlogscore=999
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110120046
X-Proofpoint-ORIG-GUID: 2DsSr53_Xg_7MOmCAIJSpkf_bU-lhY2L
X-Proofpoint-GUID: 2DsSr53_Xg_7MOmCAIJSpkf_bU-lhY2L
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Do not call rv3032_exit_eerd() if the enter function fails but don't
forget to call the exit on if the enter succeeds.

Fixes: 2eeaa532acca ("rtc: rv3032: Add a driver for Microcrystal RV-3032")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
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

