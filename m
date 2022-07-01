Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 67269562AA4
	for <lists+linux-rtc@lfdr.de>; Fri,  1 Jul 2022 06:44:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229984AbiGAEnv (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 1 Jul 2022 00:43:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233569AbiGAEnt (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 1 Jul 2022 00:43:49 -0400
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E94E7677ED
        for <linux-rtc@vger.kernel.org>; Thu, 30 Jun 2022 21:43:46 -0700 (PDT)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25UM4Itg018439;
        Fri, 1 Jul 2022 04:43:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=i3Uuf9u3Iw63UbcHjLGvsd4yHFODgEkMcmJEqiGjms4=;
 b=kOX6bUytLyrzmpI4mpEWYvtLRbX3pNABX3+RJbJDusOONh6CBannKPWdNxWIaMNzDGAR
 AmhnZkpsDBPTwA0tXu0QlHIfQRa53cQxU3z/v91zVGiYkem1oSAd2+omwMlFsIE/UV58
 7VlCSJsFbfhJjeB7yrCGMDEAhgeRtMvZTXnggI6S+rzYDiVeoMxdmyQgXEOzr8TsR2bX
 yU65lUlPwJFQlm635/vnR1mM7OPrFB1H3TRR5oRmk90vz7iYash30Hj3MFnOkdLBeisk
 k/iPq80J4ZbcX4GFe8qE30mNGz5EDAZHM5OjgSEYZWXqKjApYaOn0dpAJ4c21d7Qh2Y1 /A== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3gwsysnx9n-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 01 Jul 2022 04:43:44 +0000
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
        by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2) with SMTP id 2614Zh2t020701;
        Fri, 1 Jul 2022 04:43:44 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2170.outbound.protection.outlook.com [104.47.57.170])
        by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id 3gwrtaksv0-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 01 Jul 2022 04:43:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ngpI89kuCRxd0tpW36+aBAsFJolYkabLIHKq8bxt370++F+fZ0NwhuMQ781gamu9pMq6ZNjm7/oO0LNJjzpBO5fZVNfE3PAjDgumilUt7WR1BRuYTzkBlrngwZVRDcn6r2tM2q7whweg41xqZd1EZ1M9oKf0/JR5wixjvgZJGsKFKq+qIQRXg3cDnw2IXCjtGd8Uma/BiaAa1CRlH5quWXQiilJltGp+Wt59t/0ZytWx8rvvHGteZwl0J6TLMgEyX00ql6UNy7nSkcydqz1g2+4rNg4NQYsxckMA4r5H2wB9xOz+U3NlirEvL370dnEBGwj7xX8lzO/ajtLDVgLU0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i3Uuf9u3Iw63UbcHjLGvsd4yHFODgEkMcmJEqiGjms4=;
 b=bt4LAfjCPGP99TQbLlwR7zxBjfqaK2h1WNvm31dYkAk6EuSI8QoTqL1+uQxAJlbIsiAC2Bg0tbZhixTlpiqtqVLaNE+BSHgkA4bCexq1UYV6CmttHU+RI2AO35S7zFHCZuCV/K58VraUvxRdaUFXOlCX3goT7M7tMyMuLLzQxohOOJrwvPCatwNfCtD8lfYmP/6DBJWvEaJxUnIAv4rpJIoyTisbOagplwaF/6nld07OupDgsBmyAD/1Lwe1rqvVHxceagx3FYCy4aRnfdvOIbumryvWTBp6/CBIcpthJ1TawoNqLj+ITKyJQ+Hph+jIHk/kum4nqGikH5SHYaXn6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i3Uuf9u3Iw63UbcHjLGvsd4yHFODgEkMcmJEqiGjms4=;
 b=rHeqf2ZSb4T9zg2xIiXoxe7LevyhMorWX58b6jC2fGLmPz9q5EoLMO22THcGRwhfeFOVwUfErkDf4zpw9M1XfClS91nhcgAp9wQZL8PbZmBI/W1JADQc4ZugUahLe/7C5ICpfgvm+5Y08yT9vHT3x2X4gNgHZviOmqPKG1PpD2U=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by BN8PR10MB3331.namprd10.prod.outlook.com
 (2603:10b6:408:ce::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14; Fri, 1 Jul
 2022 04:43:42 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5020:9b82:5917:40b]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5020:9b82:5917:40b%6]) with mapi id 15.20.5395.014; Fri, 1 Jul 2022
 04:43:42 +0000
Date:   Fri, 1 Jul 2022 07:43:26 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Nishanth Menon <nm@ti.com>
Cc:     linux-rtc@vger.kernel.org
Subject: Re: [bug report] rtc: Introduce ti-k3-rtc
Message-ID: <20220701044325.GP11460@kadam>
References: <YrqmHSiHfLJegA4v@kili>
 <20220701014804.etabmwlyahsghrfx@lucrative>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220701014804.etabmwlyahsghrfx@lucrative>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNAP275CA0061.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4f::19)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 27404968-6490-4708-2072-08da5b1c45dc
X-MS-TrafficTypeDiagnostic: BN8PR10MB3331:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: K8X/QhkoFotCYpkbvaPpg+CCRUBmvQbx2FLisTDDhCCa8DhEQ5upYePrZzfsmx4mNipsJ8K3rOfINTAX1TCA6cYnu9E4FhszC0jyDxwjBJt1zwS400SjlhJkOIiYgy1Jwe4N6ZhzsA6q/mmUGgtZBKKqTAZhpr5/WchSlNSJ37ISSzvHaJTVdkgGJ0KYN/TF/qZbUP6NOa5MmzZC/+HyuGppUppjq9ScmP00OGOs49GYc/xlN9tVH6GpzMPbxSMOG60EGz/BL0wiEAt52IXTZK2KDBC2DJXjzRa1PxX5qQCMAlSFIULxF2N1Fq2O4R3jO7uOeGt8xZUQR4M01kCxcVa6GBF1i6zp2t70oml3AjtSGto+24LNaFSRiKZ6rVzlTqdC06CSW5+ba1BxzcQUYidM0EXf1kcggVDjUnkMYlLxQt0CdI7MSlq/vQo1iyGzYYGbW36AzpVcpeieJQp8oc/qmUWJEU2PubXdSemkSYHA98S2AdaYazD6W6e1BjB3A4MyguVmNGQ1HM6YrbZe2hM8Wg4ZmoRR3j8V9wBLIiXRcxTlYMP0z9sVT3o+fb5njGIcGFBMcYdn/ix5pISzHVsjar1jtRaWz/fC6f3oQE+zI3IqJTWJFDAdLCljWCzb/D9o+0CxfJZAinB9op+ssstOURVH144Zbx5ZiwVdqqHk10hNm93hWA+yzA6tnDBdZakLmA9+FOM9YX5fXO3tigNGmz2N+nFNSF7pGPvImZ+6yLsd87P4Ova6q9yfAfqLg8Oa+iOECNlLGnRKC9b6ZSnjJB/tj8BgDR9GapOTQqiAop5WXcLj/iEn15WVxIuA
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(7916004)(396003)(366004)(39860400002)(346002)(136003)(376002)(6666004)(6506007)(1076003)(8676002)(83380400001)(186003)(4326008)(478600001)(52116002)(44832011)(2906002)(86362001)(41300700001)(33656002)(9686003)(6512007)(26005)(33716001)(316002)(8936002)(38350700002)(6916009)(66556008)(6486002)(66476007)(66946007)(38100700002)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wI7JZUl5RcscKVV4BPvDXq7cbVh8lGRMfk0OGhiSZBU3RVHt9jMEENy485Hb?=
 =?us-ascii?Q?+lgfGuc5YBvomx8YubtUkmQsSzANJG4yMOHSCpxjBFEUo8FjKUFULRkkJvRk?=
 =?us-ascii?Q?kJdNXFL7z5AhBQHY/Krqg/KpYxpV8sIGj7FDWTYlDbDX/yGNDyVBD2UFvWIC?=
 =?us-ascii?Q?/yQQ/yI0hsnxwbaVSFbVdjqBm+/cz+u4RFn9h30l4rW1xl0CRk4GwH5ggkY+?=
 =?us-ascii?Q?8CbpfPyVgV63Eu527dtJB3MJfh2w9eoL3yZfeQ6zF8u06uyvDVGKCSuXaXyC?=
 =?us-ascii?Q?UtJ5u5ykGz/HdfopOngJGrjRSgZaLQBl7kYKmt4BNDKsxUqpQEw2tyLJs1KC?=
 =?us-ascii?Q?eMASK4cnwluSCFD8AvQw9832QqkHnrSt7E4rf4HRmmyM969I738wSdxpqyOp?=
 =?us-ascii?Q?1htthZVb7TSOQfYun161fkZGpEaAMUcaoxbCubuZIozMFyu293XJZXHbKWCq?=
 =?us-ascii?Q?7RYqY+UzAzT6tyRLhIWHOnl6EG5lfYRKBusewtXNNJxopILoekCy/ytIAjMO?=
 =?us-ascii?Q?WT/nH8S+cA4VhVU6SW9HW4X+pPbbqmIVeoK0tt4/t/nSQ/5ES5QO/gHkd6Xh?=
 =?us-ascii?Q?imH0kpG1eCdlYmAvvuINEVg7dGsO2KIz2WUuAhf3DlrrqD23JAQuXrK5R/ap?=
 =?us-ascii?Q?D2xt2fqdMZp6KTPYUYwqRyPTyq9DREspo6hs607F/g592Tt5IsGZNHPuvODi?=
 =?us-ascii?Q?1p15FCbDLj1+do8x4JcCkrQCfQYo3NDjaSKbmdzn9LkZLBv974hlZb2W1AjN?=
 =?us-ascii?Q?8fRJYHuloxVk67/hKvZzfs62IP4XNZQE/HDozAHYfvrD48ltK6wYQAsHEGkH?=
 =?us-ascii?Q?vHfhMVl/5XAZprY0MiBhFKlRIatb5IUr3uySq/9IgIuFbTvkWON78qUqugkC?=
 =?us-ascii?Q?1cDzY/Dy4RBB2qmp+PRNd81DCBXEGCHqn11iSOkI85WeHdRJuuEk7xQhbfHk?=
 =?us-ascii?Q?1TJHXfxX4cWbADpVA6DkHt9eIy2AzoubzI/P11t9IbyBOFZrAVoX6m3vRhMe?=
 =?us-ascii?Q?Vm89Ekqqt7fj+pPzcOcvBxtn77RHOMaqrqqNLDGiBdb2hQaXZx/dVNPiPMo7?=
 =?us-ascii?Q?I3nmacJBWIKTGk2QWlx5E0vk+M0WHVXHnOVelMlAW5frQbI7pbtsiz3dfE+6?=
 =?us-ascii?Q?hwwxnYuFDfwGpWI1poY+hl4nMmZKdrri/yOpr5qBIACY7b106XoAv2pi7M3u?=
 =?us-ascii?Q?2xKnKOIdDtHcXh7MpCFpWEOoxybdeM9Db6euCeYAC8cLR82Lfv5dI3Cv6vNY?=
 =?us-ascii?Q?31hHU91j9/UlekiYYn7jdIJ5Nd/ORH86HrfxcJlhmJTBDZM6aDMBq0Ca5H9p?=
 =?us-ascii?Q?4Xp7QcgoEg9bXEbvEeD2FPcgzKD+Mj9iaOTtwiSKCvOqW2apI2xLXEtvxrPL?=
 =?us-ascii?Q?JRa7wxZH/U3K2WN8Yql5Hws9/TBLDON5rGmfYWEs2ac8DCTx/IoySCFiIVBV?=
 =?us-ascii?Q?luJYaSisKLVmhY9b7oAdxOQkhULUwFPruNf2AS+3wJNp3nOG7zhHmLFPra5B?=
 =?us-ascii?Q?uyFtkK9QfGsBwasiZB3BpO1A+jnntnD4c5pXOyou4UGq7JcTXgqcjfXUjvik?=
 =?us-ascii?Q?uZ2qpgYaPOqZMNUYVblTyiwRmhnizczxXVVRnqoJ?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27404968-6490-4708-2072-08da5b1c45dc
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2022 04:43:42.0924
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2vowArHTGzcsR5mVr6BSn097Js6nAZsOBRXsglotMuve5nhnUfORf4Uc0l+TDjbS+rMKJn9fCwAoPil8ygtyS7AEz1p2wMxYTgsFjQuDVUo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR10MB3331
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517,18.0.883
 definitions=2022-07-01_02:2022-06-28,2022-07-01 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 bulkscore=0 mlxlogscore=999
 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2204290000
 definitions=main-2207010014
X-Proofpoint-ORIG-GUID: gS7iOGhyEjFRPtzCnd1N3mNtdsNFbIKD
X-Proofpoint-GUID: gS7iOGhyEjFRPtzCnd1N3mNtdsNFbIKD
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Thu, Jun 30, 2022 at 08:48:04PM -0500, Nishanth Menon wrote:
> Hi Dan,
> On 09:56-20220628, Dan Carpenter wrote:
> > Hello Nishanth Menon,
> > 
> > The patch b09d633575e5: "rtc: Introduce ti-k3-rtc" from Jun 23, 2022,
> > leads to the following Smatch static checker warning:
> > 
> > 	drivers/rtc/rtc-ti-k3.c:186 k3rtc_unlock_rtc()
> > 	info: return a literal instead of 'ret'
> > 
> > drivers/rtc/rtc-ti-k3.c
> >     180 static int k3rtc_unlock_rtc(struct ti_k3_rtc *priv)
> >     181 {
> >     182         int ret;
> >     183 
> >     184         ret = k3rtc_check_unlocked(priv);
> >     185         if (!ret)
> > --> 186                 return ret;
> > 
> > It look more intentional when code uses literals:
> > 
> > 	if (!ret)
> > 		return 0;
> > 
> > The k3rtc_check_unlocked() function can also return error codes so maybe
> > this should be:
> > 
> > 	if (ret <= 0)
> > 		return 0;
> 
> Interesting for a couple of reasons:
> a) yep - if ret was < 0, driver does'nt anticipate that from regmap
>    op(unless something really bad happened), so it warn_once
>    the information and does continue as if nothing happened.. So, yep, I
>    could potentially do <=0 and document the rationale - might be better
>    to return ret instead of 0 though. I can send a patch if you agree.
> b) How do i reproduce the warning that you reported?

Oh sorry.  I never published this warning.  :/

I generally don't like style checks because life is too short for style
debates.  But the real reason for this check is to find inverted
if (ret) checks.  So maybe I should publish it.  Inverted checks aren't
super common.

regards,
dan carpenter

