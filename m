Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D38542A1B0
	for <lists+linux-rtc@lfdr.de>; Tue, 12 Oct 2021 12:08:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235830AbhJLKKE (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 12 Oct 2021 06:10:04 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:23664 "EHLO
        mx0a-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235838AbhJLKKD (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 12 Oct 2021 06:10:03 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19C91Lqd010569;
        Tue, 12 Oct 2021 10:07:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=SbG+YJvxRKVuPDUjUWM6nzsZ0uaOYNc1iGfFc+nl0/s=;
 b=OHRi6InpuvVBHsXif+TUKim332C5D/glw2SaA2Da41P7ggXf/dhFx7bfnfYX0AzzBEm2
 T0x36hij0Et0jWirJxq/bExDh/YsvvPyYw1/LAlfaRKnyD/m8zR7zXlpLSTGweFuaKCy
 lDXIpNPUQSgdb08aPH4rivJv6nRU83+6sXpmolNXn67rxuR7SMlYy0kvl67/P47M3s/n
 ooQklqY5wUDLz/4stH7kzZ8glC+AA6x0U6NuV1kIDcPO9AQN4y/4PSJ4MN7C5q4XdzvO
 vlZQe9bkZRBK/lUMlIS3SP200Rjaf8VGFwd4QMzLWvd9+rZ1UJO5onIkvOSAqhMDqxTz pA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by mx0b-00069f02.pphosted.com with ESMTP id 3bmq29ppbr-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 12 Oct 2021 10:07:50 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 19CA745C036972;
        Tue, 12 Oct 2021 10:07:44 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2043.outbound.protection.outlook.com [104.47.66.43])
        by userp3030.oracle.com with ESMTP id 3bkyv8m816-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 12 Oct 2021 10:07:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E256LyXYX4QtX9m1bBYQs0M13iuxQP1lMiDRa4/W2C0wXKa5s2knwrB5uUbChdgqDN9FI4RUKHBB0TPLBMxTT2XD4VGL13Hg0yKM/iLJ9Vo7ggnvi4nbxF8YbSTKN+upua8UKMLkTpteuNs3Rq91MrKzmV2iaCrKEY9LGTignZDLeWuRKtK/rE+++/3JCocQ3tYkQQvMQoFMsGX1mFohr/NCdMu/XbEl8c+zlLNPD2h1uxfR2uENojwWeIo7EfXE+t1Q3PyYJ9c8wSwg8pqH84Mu6E4OXuQmjkQbgbW6mXJuxSK7La+6FCXO93wiITeGdt3XgPbT9ZcS5iuFSXRMJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SbG+YJvxRKVuPDUjUWM6nzsZ0uaOYNc1iGfFc+nl0/s=;
 b=cesFTkUuvUdnCoCBA1J+sXhB0bzwo1VdidMJIzYztpnHA99c81tFoimBLM6bsYCDRDSQ+fuNdYMo9t7acrpm/eJChG86iPprty76sKNoQffoBc66an+bSqUuKeGfwYpIUsoKNot/kjjo39HblWhCD4erFw6WAOoghNMNQ6+ZT7NAcfIKaOpRpSjfGg7aJXhJ+3I7kH+aOiDo75EhaBIDysmELeQaY+mKNNPjtjUdiuX3KF5BEHBcUQCOoK4Ctra6XiBCwVGfkUZPBw3xZEAIYNxAF+ILwD/E8gqnMJRvKZO/OzXMI48q7dEISb483QZypwK/mLTThUCbH7vzPP6j4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SbG+YJvxRKVuPDUjUWM6nzsZ0uaOYNc1iGfFc+nl0/s=;
 b=RG/5U8eo7Q/gbWneyVP2QUBjYLC4qHNGcIRN1KgE+/FXdgVy3TMxcJCgVSjaHsZboeiLS8QyAul0BLqyY8SBtV+9VmVvEMguOf/HJSygkOjaP5fUl+57TN4rrCyVBbFXS8K/sigBKtbS+9KFJ5POjsfz+D7fMqzqfkRQNszft5U=
Authentication-Results: towertech.it; dkim=none (message not signed)
 header.d=none;towertech.it; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by CO1PR10MB4513.namprd10.prod.outlook.com
 (2603:10b6:303:93::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18; Tue, 12 Oct
 2021 10:07:42 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9%5]) with mapi id 15.20.4587.026; Tue, 12 Oct 2021
 10:07:41 +0000
Date:   Tue, 12 Oct 2021 13:07:26 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Alessandro Zummo <a.zummo@towertech.it>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] rtc: rv3032: fix error handling in
 rv3032_clkout_set_rate()
Message-ID: <20211012100726.GS2083@kadam>
References: <20211012082548.GB31086@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211012082548.GB31086@kili>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNAP275CA0068.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4f::16)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
MIME-Version: 1.0
Received: from kadam (62.8.83.99) by JNAP275CA0068.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4f::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.25 via Frontend Transport; Tue, 12 Oct 2021 10:07:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 19b15ee4-037d-4f73-775a-08d98d6820e3
X-MS-TrafficTypeDiagnostic: CO1PR10MB4513:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO1PR10MB45132962EB2201F36556BC988EB69@CO1PR10MB4513.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2958;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FzYpUyOdTib+YfD3aRrICazOghIyns1DvvzP/6w4I+j2MuDe1QQlqT8sOUhKuNUo2LB6brRbPn28AAtow16UtdKbQAzzwp/N6LrfJZ/4ocIjKuO3MmYlf//WGR3dgv2soAsDCMs5jpMPXePlbvPFoCbKRekF3cCamjWx9ROGUeg+dJo3ipREWzSpoOEDNCCOydgGWchbUNxoD0QozGXLojzW4dDlTnQl72qtUQ+ayWd1Tb2WsUUXCsPtoXFbYUPZPaCj1mKeQB+QCrm45yZCBas1mnNGjED1f8OD6iBt+xlr1XmB4Ohcv2o3lDMilyzn67eoitLtCTS5+TT6NAKq1tbgNLMOd18IkRYpc2h5fXUx4+rosJo1WqOwtt7vzVSTb12DZZz3bf7N0ktxbgDR/coqRPx/6Tq6Gh+oSx+XCJJyDHShSh0rW8SAc9UbJWh1pfAuLSybePuy0f7BXu/KDwUXK2vHEj7VTL1W1sa8gBoLQYyIFHro3UYLgFxJGl64qLtanNDE+EfpIq1pzDj+Uq6zdzWdJT6VLgOMf2P0UWantIW5YH2aiilTmxhoRBRGJ0VjHC7dShd0rqHUGaQoTkgbq6egRCxGDjtj6iurIYc4zvF3Rafuv8bdtkW0XjL7AHhBjfoPTjztNUQ0+16O6QtASPWGnSvLiDN64euQCBDZt8lmRmhFchKmj5muNluNONMiBKFc/2oZc2zQuwt7HQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(66946007)(52116002)(9576002)(508600001)(1076003)(8936002)(9686003)(55016002)(6496006)(33716001)(8676002)(956004)(5660300002)(86362001)(33656002)(2906002)(6916009)(186003)(4326008)(558084003)(44832011)(6666004)(316002)(26005)(38350700002)(38100700002)(66476007)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KC0RaxQE97NCksxLaXy82ugDm39O74k0XEmZBJY8Ci/gARledHOVrYbHHd+u?=
 =?us-ascii?Q?vuz+NaF04BhHahyS2eInP07LKS977S8np8qOqiB57gU89GUlV2ULDRosbNwV?=
 =?us-ascii?Q?5OvDFFgyz237DN0SDed87kS5yTctwXt+0CPTL+oNobbiBwBeSAbIEhsI0bPQ?=
 =?us-ascii?Q?t9l5X7vcHkiFrAvXag6pf6YJRs5+0g+2pll0xPJ/C2X9wEUv5QSrqtoN5Ezl?=
 =?us-ascii?Q?P15U4Uzuw7B7LpcPkuj6D+JbjbucltB8692CAs5Yt0FMId+u9HdtQT7wnzdL?=
 =?us-ascii?Q?v1P0h2aIEj1YyYh1ojeFos4eWkmdIox+65AHBo2NsItUnDJblOdCuREezv9n?=
 =?us-ascii?Q?mpU3WInEiTRzoTa3g+TTGwjnFyLzSxU9N6jQsKRIy1B8F7HTor0N+4Xa2Rik?=
 =?us-ascii?Q?4cVD0Y5k8JDT1c9TpD/zqVfSMDrmYjWFHs93ZfxrASWO39xCsreA9V1YrUG4?=
 =?us-ascii?Q?RCYu7+lvB+xRoJl0iBFKlb+IDJYr0OtNIygPXaJlY904/mK84g6UFNIQbm+d?=
 =?us-ascii?Q?jQ2zIXXIwu/7J++ER5Ma2p/oFAKJZn/3UzLBKLsOcj9hZxcVBXzlPXP9fTaS?=
 =?us-ascii?Q?a+tj84Q0c48LltJuqYYMxz9cQPrikagcnHQJSTYCn2ybFg4ldv5paZui0cnC?=
 =?us-ascii?Q?1/75Q3rWUvL+b0GN27xPaBlxa+7Q1NX9jzbNbEn5Sb3fNA1vRLrJBaCvSjIC?=
 =?us-ascii?Q?3rXigg4+PA9e3Mq9kKRBsyPebPoaaEyo5UbZrEAhlxc9htIEWOZYbyaUJ4MG?=
 =?us-ascii?Q?+uD6kEDGI/eG0Apz1tRJR5Zzk4FHnHA/9LjoEeiOeLZwt2wE6INTBjThlmAR?=
 =?us-ascii?Q?xlNCY+hVbYslz4RHrHAnRndY1C5y0phLFPOLJgrTweRMbAU0+no2bhMsoAzw?=
 =?us-ascii?Q?ouTVKNxkSHQGYiQ7Yw54tQnWCrEsBNupuYFkBZrshFubnQiKZlCBBSUN9Mh4?=
 =?us-ascii?Q?ZfxUtgj0bxtMCI23rmgTMGDc1dkRsBbY/PvSwTZ/VkHeUp/zFe2wLEnLzy4q?=
 =?us-ascii?Q?w+9mgra1VvKlK7Lf7rcebPesWSSSOmuXWOgmxvIgW8V4jyMgXA9dSJNY0g0y?=
 =?us-ascii?Q?bWI5udRE+iH9RbUGQ4rXt/ZNVkdIu6UW4VmVwWaOoY0Ly1XAmDdiHv+/dfRZ?=
 =?us-ascii?Q?HnH1XhICYfI5KIt/6YVxROG2Sur9jjMurEpqi7y+fkJjykJWDGWezfyEBHW+?=
 =?us-ascii?Q?U5iLbFdpusrTr7Tcqxkd+3ARV/H/4I7XXitNoIXvPMQ+eEIcc9FLQzYD0Tib?=
 =?us-ascii?Q?Tt7yPuqOTht/EQPWmtg5SUgN43V8o5GjtREUDXIvpTWI0dItBPaoUyUYgtaX?=
 =?us-ascii?Q?2/CEbGqT2DNlm1kOQBaNNXgd?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19b15ee4-037d-4f73-775a-08d98d6820e3
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2021 10:07:41.8798
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x8deZCIn9s/z1IJ8vHiMZ2QGAPo424s2IS+f3GJAV9MHJYre3d+Cj7js3CJD4X69xDILEE2bpUJ0sZ6RRPb+LwzS6Z2HT5h0YC6DrB9CeHM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4513
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10134 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 phishscore=0 bulkscore=0
 malwarescore=0 adultscore=0 mlxscore=0 spamscore=0 mlxlogscore=976
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109230001
 definitions=main-2110120058
X-Proofpoint-ORIG-GUID: HFkEtahbYN_BMpVShmFJkaknYmZXBBFm
X-Proofpoint-GUID: HFkEtahbYN_BMpVShmFJkaknYmZXBBFm
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Tue, Oct 12, 2021 at 11:25:48AM +0300, Dan Carpenter wrote:
> Do not call rv3032_exit_eerd() if the enter function fails but don't
> forget to call the exit on if the enter succeeds.
                          ^^^^^
Let me resend... :/

regards,
dan carpenter

