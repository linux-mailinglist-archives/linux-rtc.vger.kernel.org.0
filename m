Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 877A052D5FF
	for <lists+linux-rtc@lfdr.de>; Thu, 19 May 2022 16:27:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232307AbiESO1c (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 19 May 2022 10:27:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237188AbiESO1c (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 19 May 2022 10:27:32 -0400
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF1E766ACF;
        Thu, 19 May 2022 07:27:30 -0700 (PDT)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24JDBvF1007814;
        Thu, 19 May 2022 14:27:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=dX4u/ujyYw6EbdKwZ3gOnB4UBTSENWIRhTKkBHeGz/M=;
 b=n4Emahm15smGFSHRsz/fHjoQAHbj8gsaILMnHUT4pdrxvczj19DEp72Hy80PY2hzEppd
 azO0KFw01qqMmilYDnMeJDqvl69i+UD6zVuI4oX2UsEG3RS05taVQ144QFGtQMilgZT0
 QnS/oBmX/qe0WQ3NNreG54GInoHtNgW/WnykilEBppb+Zwg67JVj4jS7eH99/puFgaKE
 Qjim+Yq7nLFfZa+ktriqdk2fVc9kJl5KrHvMEEI9liktsu9CyPF68Tm5AuHa4P+XXhmX
 v+rflBtr1F7oUemgjGyoyFiHZVtQgjuvwlL9DGr5HGgj7eKFncA4+wC2aaLUAEFVckHR 2g== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3g22ucc2v2-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 19 May 2022 14:27:15 +0000
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
        by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2) with SMTP id 24JEQ6n5012693;
        Thu, 19 May 2022 14:27:14 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam07lp2047.outbound.protection.outlook.com [104.47.51.47])
        by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id 3g22v5ct24-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 19 May 2022 14:27:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D06UV+FS1XhZKoVWvZK+lJiM9grgJtvHOv2J2LwgZCm7pObqM/LgQHZQdQ/7Pb+d10svH8yp3uxbys6YrFSL4P38+3WFCsV9uXdM0iiA0GTgHyLQ3/DYW08zsf2zuRjd709nnZ8D45CdkeMq8qz3TKdWfy55BkOTJS6DH2B6qYKePxKMOPaqwONc42trvrsZstP0lt0uoS90tkF86tv42Wouo105rfVgTpEtl+A6bGuormGgv41VU6Q65dBnp6hU3Prg1eOEiJUzk3FsCGdK2kVJQVau+tepWH4oz7nf6b3zrajtwiyqbqZA216o3AwKlnRxOH5CQ5OSGBVf+RVRlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dX4u/ujyYw6EbdKwZ3gOnB4UBTSENWIRhTKkBHeGz/M=;
 b=Xpch0k19tl55FhhRTn+NW0GOJiIdgF9S4be1IMZcRAa0cdckpDNTt/MtrtdqDlsG4F59vAFEvN4uW15+BsG8zpnTrWN0PutspzDmw3q9ff4eTvUAu4w+GYb9sejCKrUV0YS5q7TZDf6P4wvWj4FVIahtoDYT1LNDPTLpJ1sIso5m3WB4COGO2673aI0gIN+wXTMtiyTlqTCEsfc/0miqPuylB5wNpVXHEbd3p9ebQfp1Adtkcz61WGXm3rFQDrbdghsms3CSj3R4oy7o2zQuXSxDcRBJEmWeiIgasEhHtLHyUTShCgI7JniThR3XR4bGeqj+own9Zu77lEmCbdc+sQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dX4u/ujyYw6EbdKwZ3gOnB4UBTSENWIRhTKkBHeGz/M=;
 b=Kq5txV/wVtAr5G5CPc06SG1bZHkPZJxtP8COa6Li698gkubdSsz8Zo/dnoIcqUy7Y7xPMyM5bf6ITTIxXij8eQCuVF49kZ1Ki8YLTEYKWBB+CFdERC+qXa/50/L+3MV8UsHOpcyM1lu8Xot2dVo7lTM3or/58Ijtrwpax5B255Y=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by DM5PR10MB1322.namprd10.prod.outlook.com
 (2603:10b6:3:e::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.18; Thu, 19 May
 2022 14:27:12 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::86f:81ba:9951:5a7e]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::86f:81ba:9951:5a7e%2]) with mapi id 15.20.5273.014; Thu, 19 May 2022
 14:27:11 +0000
Date:   Thu, 19 May 2022 17:26:46 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Miquel Raynal <miquel.raynal@bootlin.com>
Cc:     Michel Pollet <michel.pollet@bp.renesas.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] rtc: rzn1: Fix error code in probe
Message-ID: <20220519142646.GA23160@kadam>
References: <YoZMg1dmHHSJEfE9@kili>
 <20220519160821.14230810@xps-13>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220519160821.14230810@xps-13>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNXP275CA0011.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:19::23)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 02e3b8d4-da9c-4b05-8a3c-08da39a3a9d1
X-MS-TrafficTypeDiagnostic: DM5PR10MB1322:EE_
X-Microsoft-Antispam-PRVS: <DM5PR10MB13226C0215C07EC065E2B1AF8ED09@DM5PR10MB1322.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Idv6RaSqKDCLsYSIV1mEAv0vlOsAxVuY8tyGbPg1/Wb/ku1AV7Td0oTHeQ+hf6EHhWPs/5M6YeYfVrJIlkyGBfR8O8HjlIC4Cx0tzS+gESUmnVJBP2j7ifp/jMIQZayA0evOkmq0NaO4NPDmMaECoRbYOAAd7u5QBnHZ9+sZRNd14eIpxIM1w3dK88UFogPTeLSe7fi+t3OQkE42lIu0bJRaKd+VDwJ+a7Z/5e55nYgeHtXrBT9Xyk8iKFqVTBpFYvPllpWD7SWK8CvrGwbJ7vQVE33zDMNYQkkzorGdC/hzdlMvVstihh+6bdIEX/QU+xjL4bQd2M1L71QLM5ZCBFdJTihhjHR9AzSHOnp6B+HnGtTzhMKuuxP/P4VO0gr09s/qTCkSG5/W3w4pMZcLT4tGJzDO96t5Rri05oZsrVY0ZZqIlYUWpxUMezw/Z/e3/gnplHelY7cdWGQT2EI/DCtsTLpo3CWXpq4Q3sXUjV5Z5YUZu7MvFNaTcc3SUaZNhd4SUlaUO/rXBp39qgedu3JOKwNAOyOWbagyQCIDfov/6QpGDjiTVdeuyAolcMvDdCXwwBkku9rAmHX/6gKEaEwvEuqRaK59DHzwahVGOkOWCYlx72pizx4aKFiTfDGVrnASgkljMa5UHxUXsBkFvsTTl3QoSetWA/3agI1PGXhAboftqzrtjpxwA4z/6gJ9JtvOrEH5BOWdNvoaSPJtlw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(366004)(508600001)(26005)(38100700002)(54906003)(6506007)(38350700002)(6916009)(6666004)(9686003)(66946007)(5660300002)(2906002)(8676002)(4326008)(66476007)(66556008)(44832011)(8936002)(6486002)(186003)(316002)(33656002)(1076003)(4744005)(6512007)(33716001)(86362001)(83380400001)(52116002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nmPfojvYCDqCjWP1xXGjTEzHbYgGBP8C2Es05yKBSieepMZcsG/frbTBAqzR?=
 =?us-ascii?Q?SDtk97RMoAK/nNxhFm5WJFxHol6TcaPttG2XzokIcaEff1ox1aYV1dKCDKjH?=
 =?us-ascii?Q?d7QRmbDmtXqaO9kHNTbQey6UmaCCWSwcvPP5LmOQSfUdNTY4LS8N/LP3M8Ld?=
 =?us-ascii?Q?xJuJk4OZ77dt4Z8QsIulWPvW7CHXc9skLkjRrjsrXqVEPdUX28w8o9BtHbRF?=
 =?us-ascii?Q?lip8ZHsGwYXH4wuWpQV6t9uLQ26DjxJvmOIsjGtwiXd1uXZuC1p9xdsCzHnd?=
 =?us-ascii?Q?Eb6c98mxxhyTRfpZaPmeLcdyOcRomW7Z1015pNgJysCIGozmkSWfeExeHqDF?=
 =?us-ascii?Q?YjqFEo77e7MUftjWqIg2DRUjAJSXogZPUlZSWej0NZLUDGFd+kGA1e4scHz4?=
 =?us-ascii?Q?fm5j/OiqIetVIXteGAd6oOQnPo9SlQu1y1XW+yGR61nQEJ8sF4kSJCd82Wqg?=
 =?us-ascii?Q?eSrZNVCK3qazf0p7f1hsfLXx7c8sojSAQDs4xdatLGqYqq2i/SrC6aORLJ7w?=
 =?us-ascii?Q?PZ3F1xmX+i2U+9XIG6xk+QINWH9L5sD9ejTw687h3hdLjgMK9BKh2UH7UwPY?=
 =?us-ascii?Q?rGwpeKPw9GtgsDk8OLyViuBJT48e0h1oSm0SP0kVSExlFWbil9moq2SL4uun?=
 =?us-ascii?Q?jB99qN51J5JLteCsuDudOLK0a8OhPIS3pbFLDPGaMSd0tGJPl+iGdAKR2gH3?=
 =?us-ascii?Q?CBpM6yQYZN84IetTY2R21IEk0uKpCm2+QQL+pcH8QUy9MVJ0Fs++PUXKd+Hl?=
 =?us-ascii?Q?yOTVfhn8wQ5Jg5oPWm/Rs20BP8j67DB7qBoa9KncKuWBCzipt+Ey+jbZbJCL?=
 =?us-ascii?Q?0p3zL5GYyxYekX8JpxgR7iMN6PgRPPYkqs85DbmIfg1M6TJKCi+cL9izTd4A?=
 =?us-ascii?Q?tFfcPdhFRjWoGAP5NVJ8aK4q77KFZ1Lsek4jZcdcNLqIoG0z1ta03mdGVBQl?=
 =?us-ascii?Q?On4p8C8r8mMaGxFV8p1Rfy7FlnsI+qiDWMYXhYnYvWvAXdGM2Yq+ig4Lk3Ts?=
 =?us-ascii?Q?EinAQC+8rBLTGANcGASrDoyr1SxwfjB+6w4dJEucBylXO1oFKCXXFxMxh6x7?=
 =?us-ascii?Q?Mdv333hVIrJf+ueAxNIsMLxN6pwOXYQFzYSZTNJqcCJUoQUTmSMriruDN5KR?=
 =?us-ascii?Q?8izE+9lpmaWUo7dq0kTa+eYBV3D99ioNe44al7bXKbmPVD3oEztYsF9S+9cy?=
 =?us-ascii?Q?xrfq4poDx9jykVWa4vJtrJJrIKcdycLUNaLkGxMu76P9+iffm+FfFYN8podm?=
 =?us-ascii?Q?47f6tZDgRHRWXGAKI+G4AxbAbgMq+RMEL6Sni2SfWJlVDpvizCavR+MOK7m5?=
 =?us-ascii?Q?4Rn50QZ0dqyoZPyQ6Tu7t/Z7+FrrGnUwTl17QTO9WtRiaGjev+PXsVTEdh/T?=
 =?us-ascii?Q?GY23wMiU7OlvcON2wDk38/IhbP41L9uWF/5xsTLlc0kkUeUB7yssE7iUYxz8?=
 =?us-ascii?Q?Bzvx+fF3wFrYFTyLvhDg9MIISKnbwsWGVdxAjMLxBanUaBHETVjm1v+9iRC4?=
 =?us-ascii?Q?Ayc4l5cx6gJQX2OFKv8pFyVomWP9R5Oxr4CJSWT3LIGikrEl2/xKk/w29D0f?=
 =?us-ascii?Q?MHdNhzvydygHPzjX2fGFr8x4vDRg0v23FHPZFupvEMPBmkTnj2SX/YGBRnGv?=
 =?us-ascii?Q?/XKpdCPRhMCtVywhoWlo5uctPBZ7h+bMfBwHAwY2Yl/poFsVZ5drCz6Q2vXd?=
 =?us-ascii?Q?2feIK8uwOLOTJR66zW/l5F2AoYQBXlWaspiWagYpUT4uyiIMO2L9SaTooVlr?=
 =?us-ascii?Q?NSLqQHqzxvl8NF5568SXnJ4bxXy3yQg=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02e3b8d4-da9c-4b05-8a3c-08da39a3a9d1
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2022 14:27:11.9130
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sX7kG/6DwAii+NGjWSRBqPkBx6sBfTzxVUEKHieP6PDqb05VLuFt0fWUdbEru5lewlzT4kQCAvTx8VxPI0+Yd3xgc6KEfnpMD4cngb6eN80=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR10MB1322
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486,18.0.874
 definitions=2022-05-19_04:2022-05-19,2022-05-19 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 mlxlogscore=999 spamscore=0
 bulkscore=0 malwarescore=0 adultscore=0 suspectscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2205190085
X-Proofpoint-GUID: 3U1oM41qHA_wXHT5R9jodMAVy8Ij_oXQ
X-Proofpoint-ORIG-GUID: 3U1oM41qHA_wXHT5R9jodMAVy8Ij_oXQ
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Thu, May 19, 2022 at 04:08:21PM +0200, Miquel Raynal wrote:
> Hi Dan,
> 
> dan.carpenter@oracle.com wrote on Thu, 19 May 2022 16:56:19 +0300:
> 
> > There is a copy and paste error so this code returns the wrong variable.
> > 
> > Fixes: deeb4b5393e1 ("rtc: rzn1: Add new RTC driver")
> 
> The Fixes here will point to an unknown id once pulled by Linus.

No, it shouldn't be an issue.

I'm assuming based on the S-o-b tags that this goes through Alexandre's
tree.  The hash will stay the same unless Alexandre rebases.

When a maintainer rebases then it's their responsibility to update the
Fixes tags.  Most likely the maintainer just going to fold the fixes
patches into the original patch so it's a moot issue.  There are
automated checks run on linux-next for incorrect Fixes tags so, you
know, don't rebase and then push immediately; first let the autobuilders
check for stuff like this.

regards,
dan carpenter

