Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AE2BE52D548
	for <lists+linux-rtc@lfdr.de>; Thu, 19 May 2022 15:57:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239277AbiESN5N (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 19 May 2022 09:57:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240042AbiESN5A (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 19 May 2022 09:57:00 -0400
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D03E2BE7;
        Thu, 19 May 2022 06:56:54 -0700 (PDT)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24JD9gNA012703;
        Thu, 19 May 2022 13:56:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=Uzi42S8kJZY9s1Ila/zUVCffNX18WaTgRIut48RO1cA=;
 b=lU1JZbQnyBk7o4ZyW9DMJ4FMxnxjhkLpMzkEK6I8LO7q5W0JYtuZ5DJzLOqes03VGgbB
 WBMQReZOm58VdXMLpmm7aMQccD+RDzklZu9tyEJy17pqydraPhIDcwpGI1CZ3YkqU7L9
 9AsahdK+K00P4u8rgf93P85An4J0azyj8KZ+oQ+94owOiyaf1VV++xlqA1lrHmJ8lODm
 OsyksLuT6Ct94i8UIwIzxHhbAzwJp8WkDZipG09ynR7C2iNC5ik/qxALPRbDl1Ewcr5F
 SEP3Ii71uc9WzkJ+r4dFY6e9oNwVZ9SoyNn6ynDzqchLeDFD5S/qezvisOCcJHgY/7rb KQ== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3g24aam0s6-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 19 May 2022 13:56:41 +0000
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
        by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2) with SMTP id 24JDu3uO014724;
        Thu, 19 May 2022 13:56:40 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2171.outbound.protection.outlook.com [104.47.56.171])
        by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id 3g22vaut1v-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 19 May 2022 13:56:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ndJS4XhdpcK6B97Z2ZF92zfYIisClqfX5JjSL5GqpZL+nTEjGc8pvFSsof+b/rhSd2XrXxYxTVFqpoJExp3RnV2qKvxkja+RzIe9JOWB36nLu89WG5fB5534CJb5ryL1eN98G2Ox1LvjaZiKXG0wiqGhA5fw0wbsxq1qKD9Le1PzvsBurzufdqKU0/giiAFDCDBqw+VMxVr+s5lA8rpu2azTRAYUkFofnkS++rH7PgFZrV6/AQIM0ct2d2jNzS7uAzRTAl4dCvab+SCVldaRYg18vmlHJyTicxg9gPxOm9a20sv1i6wd2LXTuFjuZlk3kjfo6D18tTKA2GDz32FzEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Uzi42S8kJZY9s1Ila/zUVCffNX18WaTgRIut48RO1cA=;
 b=Alem+EBZP9nP6YF5ej1fAyr/izo9TkQLtuQ9n71YvROfAq22zTLl18lJSHBmRRTZyrtcRt8/RyhojOhCDG+HIxiTZwZa+IYhzTMFCF6ilZXebP/Ihdtv7tdF5jUBwCbCGIKDPllKI+S/JheZp3TaTBjLpB8HBpoteByJFHOzVX6WFUQn2WUe15rArK5r3vHHcRda7RqmpuqGZXOmMyHf29kKGAl8F+MRff7X6ceOICdFEwMj87IjmmMJt3U02OmoobKvd/Acu707BLravNf1NDz+jTkfGlk86kx5fCTDWScU/+XKIQlVK7AABkpmv/g+hTBYcy4hSw1RQz65YHfr7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uzi42S8kJZY9s1Ila/zUVCffNX18WaTgRIut48RO1cA=;
 b=agQfrwUWl9UThTILJddNMdT8zDD7h/WPDDYWv5XhlSJ7NN7CiQLzAsU2JN0U1Co1JXvoeMCtlGRQV1xjmk9xlUJcBvfK5fywEbi9uJzPVFQ37Se1XxgD76eCfxz3Q1nXW3C+oTupVKumXUC6Rb0Cc/LWdKdDJuWxGFA871RPZwk=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by BYAPR10MB3142.namprd10.prod.outlook.com
 (2603:10b6:a03:14e::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.14; Thu, 19 May
 2022 13:56:32 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::86f:81ba:9951:5a7e]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::86f:81ba:9951:5a7e%2]) with mapi id 15.20.5273.014; Thu, 19 May 2022
 13:56:32 +0000
Date:   Thu, 19 May 2022 16:56:19 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Miquel Raynal <miquel.raynal@bootlin.com>,
        Michel Pollet <michel.pollet@bp.renesas.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] rtc: rzn1: Fix error code in probe
Message-ID: <YoZMg1dmHHSJEfE9@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-ClientProxiedBy: ZR0P278CA0017.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:16::27) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 595ed8ba-7d17-4ec0-b208-08da399f6159
X-MS-TrafficTypeDiagnostic: BYAPR10MB3142:EE_
X-Microsoft-Antispam-PRVS: <BYAPR10MB314236DEE75450AAAC928C248ED09@BYAPR10MB3142.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uqh+Oy9g+w2rWuHUOwc11hIpTVQ8nqu7IkBIStEiX6G4UOTB0TBOuO8olbm/rSu1NY1VYWLgEPMxo7wiQJp7VB28KygI+2iHy0YF2p3Qav1p8jYvsltUeRzT8msF14efN+LCQ+n1AWzS0a+cqX4m8MjS8pg3XZKlDM1pbWOQ7ODskXn2jSuAbvYvOYZ1kNwpnfkUFSMG9lGxbKK2JcGmBPzylX7TLLFzyyDoNRhnAEnAPgnsP+OPiUAD6ogiOvm8KZj534hUc09pkVzL886wQiFDJeszyWLzYX/n/aupUp30+el/+UGsjEaMexA83GjKRYbFByb5CZHyi3sEa63mqyeUVGlgUAQ+KRTud583kTd4b2AUetMkhVorLzslRWtwnLbRe/JM9ykDnrBFbKzjj7W6PxIuSU5OeOs27m0IfTQy/nmN7hnBdPrd7owB6G6UMOUsX6yOsdaNXAiBH2yO+ptHDczQsFqPsORV3/QozCDDlLVeQe7l/uPLSuOykp0NNP/DkC6CuoA6xRVbjZicFOCiUAWBUglivoK9WjF8ijgLdHY7EhGxZBw5z2u9cX0Jd+IkjqS1uGrisLxfLHGOBvGVcLlJ48j++FucDMsqPgLv+qg4j1uMDacCuqo5h41ZolLJR7PkzEek4j6pWAr2WzJz4CNj8hHGcJZkTxD5iOmBgxBC1Ocl5LOSY/WTxkGlxjmGGm5tSAPuQLoUwwsnWA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(366004)(83380400001)(6666004)(66556008)(508600001)(38100700002)(4744005)(54906003)(66476007)(4326008)(110136005)(186003)(9686003)(2906002)(52116002)(44832011)(8936002)(6506007)(316002)(86362001)(6486002)(38350700002)(66946007)(33716001)(8676002)(26005)(6512007)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UV2s09An/fbpV3RqMLogmTJMq+b9AomoQ+zwElAtkyeyRmnxd8olePqYDpd8?=
 =?us-ascii?Q?iTKeuIjVBm5vUuuayPPyB/7Wc19zx+FXCPbOkTp0nwPM4qyfiTvhxuKCoE5R?=
 =?us-ascii?Q?l90TXXi0dVpx7PvhGBsG8uIeQkH0Q8Yrhh/ceUKalShFkkmJY2O5Vc3AArxY?=
 =?us-ascii?Q?wpB/xrgIfVOtpFLddvtfscjfNNtfbgrEpwKe7kLXfFX8tS4x+6NyBy8W8iZV?=
 =?us-ascii?Q?SCY8HbYibtPhIiJ6thuWLKs0MldCB4V0mNN6Ioufd12F3zj9Htd9szkpbxCc?=
 =?us-ascii?Q?RsNllh0pSA1HRbZnCwa4xcpuyyNmfSsUwULHi/zoyHFDXVTrbZ3pT+o1dACL?=
 =?us-ascii?Q?K/I1qHcgDzCWg0cG2RWRkjuHM9ySwpaZ3gHeGOgdOPQ3rfsXtIdnl+a+VI+4?=
 =?us-ascii?Q?bMoz04bKl8ZHqunWcTXcDEMX/xRuQzQMjyCiGfDRB0QQpa45ZtDuWfef6pet?=
 =?us-ascii?Q?V4W0m2WPlm9N0iMJvgmiqD3q2U+etW+W8icHYrOQdKIM1L+2rkBon7nehV1N?=
 =?us-ascii?Q?Kd4ZQ8ujiyt8ZkhUYz4LVGGhqLLqIulKVg65Sdyplpe/FYbhrquJI8oP74IG?=
 =?us-ascii?Q?iiNcrokKYNwk4YM7pTsP6ZPBlBEBy8+dT6ea6iy0B/JWirdmk6bjHLpnRY+z?=
 =?us-ascii?Q?+78OwDuI/LcsmemUP51A3+/Rxeusxhkuxn/3utHIP9UPe6LRIZil5CrHaLNa?=
 =?us-ascii?Q?R+c8ypSGhEL7Vrnm4vdAMhsuBDojm9Dtt4umISM1PlZcxpojgZ+hbnVCqS/4?=
 =?us-ascii?Q?Vvs+zFBbYOxMphZbjStmzeH6UaiHebe4cLnRIubbTNtMje9C1WsJFjOhAU4m?=
 =?us-ascii?Q?fZfm1Fx53wFEIHEXovY9jTjHVEZYZbQnJzUbq1c/hB6ojouFNFclob1QLdUm?=
 =?us-ascii?Q?b+eD9rwk/o58qSI0R3rirzAFIhPYZFs6Ou2gh8NAibI4lA2NDhLGdYixRx4I?=
 =?us-ascii?Q?ZbmgsWNZVGbEyMHTmZv8D1EuzJC3c/vcl7zQmpzbBJO+cC5H0XHqtGucaFlk?=
 =?us-ascii?Q?hpjj5ktts3F5Nr7SY7PKxoIIurTnZkGalCJDHvIVFlZj/i2pcu0sedzikUyY?=
 =?us-ascii?Q?ZzUC+lyD6D/30qASKcaJu+JEQGJVOLVYQdgLqqCE/FKhLoOcGP9HdT0tSz3X?=
 =?us-ascii?Q?JwtcdPVK4pehM7c2sy9Z9v5pvq26yGQQl5jdKLj3BhoutT/vnHYcEdrcCrXa?=
 =?us-ascii?Q?qXZZ9CgnJmmp6FNcfafpCjSP3kS8pk+Go5VdnlrxUQNGGuExLxdYk4H2S8Ef?=
 =?us-ascii?Q?RokCGdXo7pZ/kHm/d4qOzgzfIMVQ+KgqzyeHDMdwcx1T7g1wQp84tX8Fa1YB?=
 =?us-ascii?Q?9gz/nEgMnDle/ZSnixF9zBH4R0f2JdRK0mv9fphiBaJH6S1FgjAKkQrnfT+K?=
 =?us-ascii?Q?A7jPGLrwT2VNUh6+lniV6ujPRGyGs4LthXBYQsW/f9BbTKhCR54Lqeh6n+LS?=
 =?us-ascii?Q?Xu8fSCm4nmK2y0b8GXAE9RWbezQnCe4yGTlrYYsXHuPMzxERjQejsEXnFi12?=
 =?us-ascii?Q?MEY+WmpBPEUMlps1UM7GIo6tVigQpTO2Hf5rWpijwatUycLHj3L3pt3qwtSv?=
 =?us-ascii?Q?GUCVo2Q6uDNebA7NFFOgyemQOmoCopP5WQeIKcVYHwETvj/XEsaDaEx12rg+?=
 =?us-ascii?Q?7q85XwgGJiy3HgTusKVBEclzLCUTj/BxHf8hUdwxjgatEZVgLw6VX0IV3pjN?=
 =?us-ascii?Q?o3hUk8a/Gg8XVKbrukWFHCuIxt96o0juhDWf8JxkMICUofp3QqwJkL50GzxM?=
 =?us-ascii?Q?4druQyAvM/zzDM3hn5NdJnHj3ASIrFQ=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 595ed8ba-7d17-4ec0-b208-08da399f6159
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2022 13:56:32.4385
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 921rQkyhzxZ4IkV2Q1liyZJBqxl4DTC+KFp93lGITi3y6MwwvZB3vMWuwoh7wx5Suz9qZoy9emg3xCHM+03gAfx9+w4UjdonwbpiYLtdYRY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB3142
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486,18.0.874
 definitions=2022-05-19_04:2022-05-19,2022-05-19 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 spamscore=0 mlxscore=0
 phishscore=0 suspectscore=0 mlxlogscore=999 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2205190081
X-Proofpoint-ORIG-GUID: Q4j4anLN3fGRKXzm5o4OQmbljG9X1f3b
X-Proofpoint-GUID: Q4j4anLN3fGRKXzm5o4OQmbljG9X1f3b
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

There is a copy and paste error so this code returns the wrong variable.

Fixes: deeb4b5393e1 ("rtc: rzn1: Add new RTC driver")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/rtc/rtc-rzn1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-rzn1.c b/drivers/rtc/rtc-rzn1.c
index 0b4bf6e43464..ff49cedd98b8 100644
--- a/drivers/rtc/rtc-rzn1.c
+++ b/drivers/rtc/rtc-rzn1.c
@@ -348,7 +348,7 @@ static int rzn1_rtc_probe(struct platform_device *pdev)
 
 	rtc->rtcdev = devm_rtc_allocate_device(&pdev->dev);
 	if (IS_ERR(rtc->rtcdev))
-		return PTR_ERR(rtc);
+		return PTR_ERR(rtc->rtcdev);
 
 	rtc->rtcdev->range_min = RTC_TIMESTAMP_BEGIN_2000;
 	rtc->rtcdev->range_max = RTC_TIMESTAMP_END_2099;
-- 
2.35.1

