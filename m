Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC68D52D541
	for <lists+linux-rtc@lfdr.de>; Thu, 19 May 2022 15:57:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239213AbiESN5M (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 19 May 2022 09:57:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240039AbiESN5A (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 19 May 2022 09:57:00 -0400
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9AFA2AD2;
        Thu, 19 May 2022 06:56:53 -0700 (PDT)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24JD7m3u012659;
        Thu, 19 May 2022 13:56:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=eoa1aDI33txEE3nQ37P0lSLThMilLcFeiyYpC+asg9Q=;
 b=Ts+LtocLqV4rVSRX+1amR2N5YtpE3mgRZcgrlE5xeIG+MQJGHZLSJ/X6nmQdXbyruApo
 tBcdEUp+Ppdl22dHadJYQ230hF4RBeQZpQYec8wtKFz5nL4SA07w8RlrH1Npeh0XFgti
 HHsJYmTbWlm8mqTEs4MCUy6MIOFjs2mJXucvGwr3lB8wYU9+fldUOVctibjS81Md99Ba
 byBfXjtLWO+ZvJLk+B55VN+uTPCKSFPwSXMvFZZSubV8Ek1xbUbNOu1EZ4Bt8ONmPFMY
 Lv0SpdObMb9DufVJxw/XmLz35LRFnL+T7sbdMISlr4YzITCpRnjNkuLQiNrOP24n6zLb sw== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3g24aam0sr-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 19 May 2022 13:56:50 +0000
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
        by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2) with SMTP id 24JDta0h010669;
        Thu, 19 May 2022 13:56:49 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2104.outbound.protection.outlook.com [104.47.55.104])
        by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id 3g22v52t8q-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 19 May 2022 13:56:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ke9CRSgIDtmhPjxeYkdyXp+2gMR6UxNKcj/fxUfaqiSQCYbX7Cs4PfMcbBDaqZIseDw3T9pl62IQamVs3QwCt3YTy4swEt2lY2w2/vicjqMDC6Wfb7Ga/p6FuMskSsErCs9MN7b+seZmKjtOpZMba6iM3PLOC8+aGZKImvNBvXiYSauI1cEoU58rhabFnMODfIP87IlIIci71CrvX6nhy8a4zPD85bfXxi+wbsONummphNnSxtS5kF6L91osS+mRI+nhC5O/8muISchGJE5m2zwGYSU8yvgFVXRDj9Bbh4kxWpPBl+c5omVZ6U+hYOQOTUF8i3Nk4hHMZXCg7iWnhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eoa1aDI33txEE3nQ37P0lSLThMilLcFeiyYpC+asg9Q=;
 b=TaN91//6C7i/ZFkgNQXc/gjmj8F7I44vRg6gPhO8JhoYG63iWtWTqrzoOLOHMivqEg03Zk7Ts0rxg04L5K+jaeZpQvyZvWoCzTi/X+ezO7pP6+uBXiSAF2RVcxa2iN2L6uUe7qtW1M2mvr09qooQIKcsgU8hfbWbmOpqPBD5EO34nkAKnlPiXFlWwizD5o8mobIj76pO2x8T/7loXd6/6SugiIVNxNYb9gk8pIJAeWCGx0ZMDW1mzyFlxLTwl7b9KqlF7RrJWWRTA1ofa+j/3Yj4dvNftiHmIoqOzAkdbK1B0JO/bHBiFiCWwpqob1nsQD324hjcbeuVmv3JM3KpXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eoa1aDI33txEE3nQ37P0lSLThMilLcFeiyYpC+asg9Q=;
 b=WM+38M++nCQF1GJrUonyy2WxHh6C84Wn613PNcZEDK6IEcCTzqwyXYJ8sYZTJmWDvwLsExFet/hgtQsCDfbl6u+cAOLiiWqn4o8w5STmNvJMuVtYJupg7UyxHX6+ZGx5PHlWUg+hMOOSQjlibPHVkMcte0No8Pneg+xf8cnKTGY=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by DM4PR10MB6182.namprd10.prod.outlook.com
 (2603:10b6:8:89::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.16; Thu, 19 May
 2022 13:56:47 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::86f:81ba:9951:5a7e]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::86f:81ba:9951:5a7e%2]) with mapi id 15.20.5273.014; Thu, 19 May 2022
 13:56:47 +0000
Date:   Thu, 19 May 2022 16:56:31 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     miquel.raynal@bootlin.com
Cc:     linux-rtc@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: [bug report] rtc: rzn1: Add oscillator offset support
Message-ID: <YoZMjwjcDlVCG+TR@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: ZR0P278CA0068.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:21::19) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c26cfd4c-c581-4d87-a675-08da399f6a39
X-MS-TrafficTypeDiagnostic: DM4PR10MB6182:EE_
X-Microsoft-Antispam-PRVS: <DM4PR10MB6182F274A085E81A22FBEFA38ED09@DM4PR10MB6182.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4iiBNtpRATBhB+gY7tqJw3jehpWNQ/h2t4KSEEN2f1GDIs62o4Zln8CZb993zzgkEiTBas0c9hCMqXb3/m4M1DiZAcQiP93FD5u36/GJLz86TXnHXb6xXw933yzgU5OeLCq2F0Ed5GoQqaIVSUwFhpJR4nYqquiqTpMx15emTij5wNMZSHThYTwcSic/Tpx7Cy/G0cGgiuKXWPLghWvRJk6HZHRjJWaLWTjFS0ZAyQ8w2syDLzg30nsTbOxcqptr1YflnQsu1H9S9S4L73R7kiDxpcG/w9lK7U05yQR4oSaTX8HrmcJKkc1vpe0NOoYj+wD/6oCMXBV0JTWgIMCkPMZlCT0eg0avW/zInFFChmH4tzCEoYLbb4MQlMLkn0rpekrPUcwubpbHJENjGd2/xOb0sOq+TpXCY12Md73k+pMSBTMI4f4GhCPZbK26ImbtfCYivcx8CPh0hyGbqJtukkD0zbldTCE6u67G8D8/qPyK45OcPQ9HqFNSV2HBBwhujzp4oR4OgVeTtbWVAUsyS/kG5yW5s80rPCbtwg/Ozvxq0+A6VAV8Bj71AlSR3tdZ7UMhpGga5tIjUwBW88TTrMIRd4E5e/8IXKJWvi9AffnCT8Nf66tWYHwT+GbeoiBhAE+JYLlm/FWU/JS5GOxu5GiqypguiAgzwBTa8pF6jSRyVAOvSgbgnR2IRTh/Nuy8wrzrUp12EjT0NmgxLsc424CbRUR+W3LEL9Fa7spOORg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(366004)(6506007)(26005)(38100700002)(38350700002)(86362001)(6512007)(9686003)(83380400001)(33716001)(8676002)(66476007)(4326008)(66556008)(66946007)(186003)(508600001)(5660300002)(6916009)(6666004)(44832011)(2906002)(6486002)(8936002)(52116002)(316002)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fzoNqpH58Nl5m5vetuZ1uGWk2QgbhokSOk7Ypgrm8VmNt+ZvubctoP3+pj97?=
 =?us-ascii?Q?b1tmIF+JRcS9SeIjRQTHF4H4ti0vLziu5n5wdHmC+41uLkHzdiVazxjeZdjR?=
 =?us-ascii?Q?CCc1LamIv/x8/sRLyTR33mH9+Gaq+FoS9KYZWI/mf/fsXH9DyWR87ye3JP8A?=
 =?us-ascii?Q?sMnwurqw5R5Jnc0ZwrUG6GZ603wPBn79S1AfN2mOZVMNKqGnj/SkjrzXjGco?=
 =?us-ascii?Q?dHfU3kti8es2cQpFFdU07Juwu4buniZdvMFephQFHwo8zfloz3tGxvNbbKJi?=
 =?us-ascii?Q?m9hHS4YWP5vP6RnqJ5ZbtPxea5QI2R6FWs+T6ax+Bd0+jR6ZVtoAB8coRn47?=
 =?us-ascii?Q?lLbdle1erhB8wAAiFQvF3QLQ5iA7ax1fyIVU/brgC3Ed7XZKOeDpydCUUzGp?=
 =?us-ascii?Q?/7hfOyEzWmlzKTVbnhYmXo610lmNX4IXoS41M4lZhAA9a0gm3LEm9Aoee46Y?=
 =?us-ascii?Q?TBPmeq0P0dFFkJ25pN6I9n4hfBzGxIkeOn6aZOI+WuyNH2ImVmVyd32goT2l?=
 =?us-ascii?Q?UPylAQtsiVOHn6JOA4+a37O7SzvM3LfaQTrEq32e4MpVEZz2B4TyEvSn7ZBq?=
 =?us-ascii?Q?y7xfzoQGlM5S6VU3ffg88Gdig8oUbG5Gd6evXNO6xMes+ySgVdf5XA9hQTlH?=
 =?us-ascii?Q?1IkCBP0Q1Pez5NtfCuI3PZTz9h2Q51J39sdz++tCQ0hT+t0qWmaZwr5zjqin?=
 =?us-ascii?Q?VBPCQcYE+Q2DpaxjAE0LQuRxaJJUtsVRjgeDABkShUu2qjCe+ODvEuGvaPCN?=
 =?us-ascii?Q?+3w/6UewS2PRgTyGVaGznrHCIQe+b+ZsRuyUj+RtxnK0wnGYYayhnicT7dye?=
 =?us-ascii?Q?UrFGPu34Daan924jkTSZO7M66ilQDnG0ICmWZXQVZ1vshUc4Zj6uuIgA8FuE?=
 =?us-ascii?Q?4/AEnOf0LGcfGj26IX7XJQrF4pQp5v0k7m0UWa4RJqjhi4EvM5V96Bm2Lk7I?=
 =?us-ascii?Q?EjYlILjNVjEyzO8HDW3EjCIbpfZN0UR5h0o65ytvZlhvO9/PLBEGjq1a+epM?=
 =?us-ascii?Q?Fw8tV9jPIm0CTZJ/jw4pE54u0RGCGR4Z+DgjtUjlTzuJ961gnXiV6y8NXXgr?=
 =?us-ascii?Q?I5lJHG74TThXIuwoD2wqv4Xf1OkV51kKwbzF/308ctx00Ceuzux+PxpNKxqP?=
 =?us-ascii?Q?XlgThmutCgwR0xjg2E0RCTpKtlPRieCTZ0CvRvBHKJEbR8htUvrE0JTelclh?=
 =?us-ascii?Q?o8tDdCWe19u3TlZyUyRocTefoyoGg58r7d0yfsj93TBXAVF7cIR55slZQte4?=
 =?us-ascii?Q?1KfX+aHrl5aZ0zfs/hMKILQpndcYG/8eTHEmxE74XgLTwVdbeQGfIY6AyJe2?=
 =?us-ascii?Q?SlO2V1gk6h3mbExMsssjzEb1MnqEmKLqjCHAw8JEPdI2ia9cik3waY0t4nsy?=
 =?us-ascii?Q?GANZu9DDnQxM23yRMEOSqNUD4xIGpp7vb+2lBRZJ736zUujb6BZ39NMuZwIF?=
 =?us-ascii?Q?VkBgLliDah3kd28Kq8mfjJvGssKfcaf22vV1LQGOyNxMHv4rpxxUHQlH26Ov?=
 =?us-ascii?Q?H6ASONLH4rePd28SIEoBEO9vntVQg/OezmF0i67OxSnRieO9SrptTBcqAO+8?=
 =?us-ascii?Q?CPZoptU4t6AYh5Q2DY1rEekUh3zjfxuLgAnZdn/EfWtl9PCmxkkjEGqJBASK?=
 =?us-ascii?Q?2GZshaTBHrus4wGrlzZY0jX98Dpt6cfNIkpMh71BrWffOcNIFH2qdauB0Jr6?=
 =?us-ascii?Q?qCQCtDdTiyNQMPxGPS3DTEaM51NdECCFX7a8siXSzfU+LY0viMtbh/LF+hhe?=
 =?us-ascii?Q?JgpXVpC4nDgr+PCTpjaNLPT5+uFnrL8=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c26cfd4c-c581-4d87-a675-08da399f6a39
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2022 13:56:47.2342
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bed+/R17NojiynW9RZ8TFSyF8blnJD44YZDBHjJf/HR69CXvkQ/NgLEMtYgnnu3iwReZKraz82mQRZUzfS65Uty8PtAvPpE0uoWm/ho3CT0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6182
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486,18.0.874
 definitions=2022-05-19_04:2022-05-19,2022-05-19 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxscore=0 suspectscore=0
 phishscore=0 bulkscore=0 adultscore=0 mlxlogscore=676 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2205190081
X-Proofpoint-ORIG-GUID: B9gnvpNEMMIySwtM6tn9lIzg24mH25B7
X-Proofpoint-GUID: B9gnvpNEMMIySwtM6tn9lIzg24mH25B7
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hello Miquel Raynal,

The patch be4a11cf98af: "rtc: rzn1: Add oscillator offset support"
from May 16, 2022, leads to the following Smatch static checker
warning:

	drivers/rtc/rtc-rzn1.c:302 rzn1_rtc_set_offset()
	warn: 'steps' 'true' implies 'steps > 0' is 'true'

drivers/rtc/rtc-rzn1.c
    270 static int rzn1_rtc_set_offset(struct device *dev, long offset)
    271 {
    272         struct rzn1_rtc *rtc = dev_get_drvdata(dev);
    273         unsigned int steps;
                ^^^^^^^^^^^^^^^^^^
steps is unsigned

    274         int stepsh, stepsl;
    275         u32 val = 0;
    276         int ret;
    277 
    278         /*
    279          * Check which resolution mode (every 20 or 60s) can be used.
    280          * Between 2 and 124 clock pulses can be added or substracted.
    281          *
    282          * In 20s mode, the minimum resolution is 2 / (32768 * 20) which is
    283          * close to 3051 ppb. In 60s mode, the resolution is closer to 1017.
    284          */
    285         stepsh = DIV_ROUND_CLOSEST(offset, 1017);
    286         stepsl = DIV_ROUND_CLOSEST(offset, 3051);
    287 
    288         if (stepsh >= -0x3E && stepsh <= 0x3E) {
    289                 /* 1017 ppb per step */
    290                 steps = stepsh;
    291                 val |= RZN1_RTC_SUBU_DEV;
    292         } else if (stepsl >= -0x3E && stepsl <= 0x3E) {
    293                 /* 3051 ppb per step */
    294                 steps = stepsl;
    295         } else {
    296                 return -ERANGE;
    297         }
    298 
    299         if (!steps)

if steps is zero return

    300                 return 0;
    301 
--> 302         if (steps > 0) {

This is true.  No need to check.

    303                 val |= steps + 1;
    304         } else {
    305                 val |= RZN1_RTC_SUBU_DECR;
    306                 val |= (~(-steps - 1)) & 0x3F;
    307         }
    308 
    309         ret = readl_poll_timeout(rtc->base + RZN1_RTC_CTL2, val,
    310                                  !(val & RZN1_RTC_CTL2_WUST), 100, 2000000);
    311         if (ret)
    312                 return ret;
    313 
    314         writel(val, rtc->base + RZN1_RTC_SUBU);
    315 
    316         return 0;
    317 }

regards,
dan carpenter
