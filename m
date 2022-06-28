Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 38E9C55D7A8
	for <lists+linux-rtc@lfdr.de>; Tue, 28 Jun 2022 15:18:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245123AbiF1G5A (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 28 Jun 2022 02:57:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245189AbiF1G45 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 28 Jun 2022 02:56:57 -0400
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80F6E2716F
        for <linux-rtc@vger.kernel.org>; Mon, 27 Jun 2022 23:56:54 -0700 (PDT)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25S1U5hF002153;
        Tue, 28 Jun 2022 06:56:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=5jmV/iM39YKysmZ2iL4JjXIVz1/ei9paagynRvGX+OY=;
 b=0iBwElgazcJgXAmvm5NwLquQhFSBj7bCDN7J0NxtNZlaIml0DNp4pArd0xgNMJWpRlVy
 igEA0gw7g+hqaB58IMfS1MH1Yu45+RFinpKpD9xvPNHXtF0gijrGt3ZECtcChFTeqQP7
 7l+aBzyE7Pc021rympi/pY61YRm5F8+pzwfaJ5zphhAbSXVeZj87MfqxHMij0qrUp4qi
 t7XId2MhYxBZbGDDglc0DdQ95jWN7ApNI7HhkpHXhzliueHlx6WpyvMTXctojEtiuTiq
 uJ2WqbEqWOw9DAwVciNryQtF56oNkDETG9oBCPigKI8rzbTamCjz9gQmbsXfYA5OYvui lw== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3gws52d66s-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 28 Jun 2022 06:56:52 +0000
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
        by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2) with SMTP id 25S6uqJs033193;
        Tue, 28 Jun 2022 06:56:52 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1anam02lp2041.outbound.protection.outlook.com [104.47.57.41])
        by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id 3gwrt7xqn7-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 28 Jun 2022 06:56:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=miHMdSYU3XVtN5+V1goNmP0H+Zz2WwxZC3ECU7YA5o1PK6sgKRszXk5y/jusjIsAkup3hHmj6RoHw9jl3mJ+fFrcpP1E7oXas5Y1RlGVyMfoQiiiYw0tDn+N04ysr039ipVenl773gyTELkLSUW9SgIqZeZ+t6hr5toq5xy3irsoRh7w9OGyTw5JwZmejeO5iHjBfcKsHb/Y+OURsrsZVSRzeQ/L2w7KSKcTdm3UQLgNSYfOD4NZxax0w3s16cxBI1umersdZF6D9qBQGeDHLM6pcy4XQtID9ctDnh8gIDLf4K7w/EaEtHC/bGc/42sdz9kwZB23/qKGgm5o7xnDBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5jmV/iM39YKysmZ2iL4JjXIVz1/ei9paagynRvGX+OY=;
 b=b0rfhQk7993zEO4vUhucsG5x9hycXbsXdgq94ICUJhTn7m+SX6IsLC84aCElVQhravHmyQ3FBOniwJfDLpkq0FEZ0GSLbTFmF+7YcbAk43TIkBp09At1QAbiUv2us+tqhxtnRbNQ5zI/e7nuAHT2WRptMnpz/arUaMz2mukbhNlzxBzfnoXDzPko5djP6VWMYcXAVITJPB9Ugycr+yeDdaOcUwuO0k5D2QEi6QeHqt2NOF8hWXF5bPe5Fs+R1UdiKPBpblR+Rerq5VZB5gA6AnRxOqpwVjyt2c3ysO/oevV2W/DC/isIDD3xzbWFZKq99n2wfFxjKvQnZCqEUuI8Ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5jmV/iM39YKysmZ2iL4JjXIVz1/ei9paagynRvGX+OY=;
 b=bVbTiDtEkfrJXzpS5gRmHyEOD7jgjiAQu/vDbzjMelyK9b0nLceig0c3BWEX7IjqhQmX8Uzpi9nTO19m3YRC4hhbhStETpIO43W2hHWc6pKKgYEj2K4JYShLVXgpe4XX0aKg4/4fUBEXAujvzM4vsTB8tVPGxR6gsUTO7Lspk0M=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by SJ1PR10MB5978.namprd10.prod.outlook.com
 (2603:10b6:a03:45f::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.17; Tue, 28 Jun
 2022 06:56:45 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5020:9b82:5917:40b]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5020:9b82:5917:40b%6]) with mapi id 15.20.5373.015; Tue, 28 Jun 2022
 06:56:45 +0000
Date:   Tue, 28 Jun 2022 09:56:29 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     nm@ti.com
Cc:     linux-rtc@vger.kernel.org
Subject: [bug report] rtc: Introduce ti-k3-rtc
Message-ID: <YrqmHSiHfLJegA4v@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: AM0PR01CA0088.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:10e::29) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4ca7959d-a131-4128-b9fc-08da58d35d30
X-MS-TrafficTypeDiagnostic: SJ1PR10MB5978:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lf6Zp5a9DGHswOdQmcNsZLaINqNuXNj/uaNXMBD4RaHBJDlNk6xS9Z3YNv5iZVr1nMLnizMqC5+Q91HZwMH6I0pEeew1S3whxZ+jk+I0FhtX3zejV5E34bLwb/SQzm4wk24xJemUeuo0fEaN91tYL33r9oM9Bkh4PdDvpil15hIrOxpsDUYSfuAhzgtJIPuXHfk6RoDTpEeBZ1yrXexwV/oGuwYegyL6QcifESuWVvIB48IVNcHVR+suhvu5JbdF5my8v3nS7qdopp1bVfPBdgYcQ6aKgVmE7sWZN14Qsd9Cs16nnOF6HxOnKVmUuSTk7XW2r1htbQWRrBm7Z4PPLUk0LXyECorHkoAEViQO65rpafk3dMFz7/BZTG6pPLeesyW6XUplhMhXqGI9AxhdWdoj9GlCfg5NUDRPBXxztP3VG6768dp9HOHKegkJ58YohmaDw7nfodW9ZHMTD1GqfoEeN/IxwFhtjq6o7I+DfStCBkZQdenJ484MEKKT2rXXmbSZNqXii5hmWY8yNxPRfS26qktATr8+d3HscI4yv+IizHV6c6dBm7UJhTxn5Uaw7kvos/X1KaTP1HEoXuM7yCGfU/Wow0JgwJe/yp7fAQth1Q3ZXZkNoqT3BFMxMgfCK+DTGFoVtrwE6o4NReZRjGySpstYNNNzEYaYrZ58TsS1ni1SxSQ+8XW8y78vh2xgRl2133lgjzUr4DPR05QwgiPYxHxNn+gpn0/LDwt/XS0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(7916004)(376002)(366004)(396003)(346002)(39860400002)(136003)(66946007)(8676002)(4326008)(66556008)(66476007)(186003)(83380400001)(5660300002)(8936002)(38100700002)(33716001)(316002)(6666004)(6512007)(4744005)(9686003)(6506007)(6486002)(2906002)(478600001)(52116002)(86362001)(6916009)(44832011)(41300700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EWf3zNJTLKzOX9j5JFetVPfFg3Qa1MG3Fd8ejTDlC8mkGz98KM9c8D6awTEz?=
 =?us-ascii?Q?xTLfg00LLb6Q05SrAqdOnr2hk6iTD1+Z3cHS4pJR/0QMshr/2IkB9hUvfEOt?=
 =?us-ascii?Q?ufCjiOToU9Wg8OEsT4I91fokRKEWQCgbC5Cz8q3YFO8NHmQGH4pUFUI7PjmJ?=
 =?us-ascii?Q?OrlOK1TrJ3Sy/w/dB+vhAIfslYeik7nIhh6qVFJ0xPzJek5gY8SlUkQJesxw?=
 =?us-ascii?Q?nI0vLgKRUa3+0O+KKZiOdw0gKkO6lcwYIL8B2sFp11R3eIexHou09esKiKTb?=
 =?us-ascii?Q?2zoW3bh+JTuJL8mxquAwrgGNycZdnm+t/kOU9Cm6rU1xvib4MUXgSGfv7HoT?=
 =?us-ascii?Q?rghswBxFgM8BfrWoq4QAr3rHxBAWoe9U/U4Kb9Q/vA19YTty3Ph6Mq1UNW7y?=
 =?us-ascii?Q?T9DNqLkmVT+Kmw5/7M+0GidssHIrIppa5ycW7exDpa7gLuoa31bX/BnSiRuh?=
 =?us-ascii?Q?7U2ID8U6GvrQo0COsG81f41HYhq9Ch4Ne4+m39d5p/nNQv4yjPPa8pUkkO81?=
 =?us-ascii?Q?FgTZJT6YStmkYYS98kdk9/dtcHWBu5PtL0IQfz+s7+onrxaFORcTi9lvkYko?=
 =?us-ascii?Q?idmuVfQiuaMqNNl1O6qvwvrEoXvo7ya4w1P7hzppuB5Tt4sf49h2LL61OuA1?=
 =?us-ascii?Q?AKOBaMjxOxr5sHQG8zYilpu6MHPqR7k54kSECi8xj2mK8fGfiOUzhG7wmrx7?=
 =?us-ascii?Q?goEZv2v5m3VcJSlkWICmsGzi0qTkf+8T7n9tf5ZhtfopDi/KyIS+F99ozGSK?=
 =?us-ascii?Q?S7wsW2krkrPmq1YgkOPiwUrxOGA9trwWTvrYsMZV8cpgoaD+tyBBfySbrSVP?=
 =?us-ascii?Q?rZ/vuj58cf6+Ibp41iFlbzoITOaN3znV0otubABJCJ2m7x7EsDCH6UU7TiOh?=
 =?us-ascii?Q?fO96zNUB1KW9fUgKitOaiM6G5Av7gO7LqXVARXUcjmky44umfcg7ALrjzVVm?=
 =?us-ascii?Q?+z+XfWoOnMd+qQaNgYIA171g8t/+iA8+tpo8y6z+2a/K/wQ2qcgTiyxROuVO?=
 =?us-ascii?Q?c+Fnr90ODulgMeRq9d22RJadc93lqlqlg4vSd2YSuWxxj5sBMv4CM7St71zL?=
 =?us-ascii?Q?7KmYw6Nl54Ju+OJ6iAm+jL6xQ6nwuWhRtqWXK1FWlnZj0th+QPmaYvlOb1Ii?=
 =?us-ascii?Q?BOsUfj6Gyc9Q3PaWyUOi+KrQYMbuitAebGk+6Igl8+QmxCHHOaAF1rMHGTik?=
 =?us-ascii?Q?LH5bzEYUNPwJyf1MvDeqLFqENiz67UI8EFhBDNQV91gXdSaT49eEj8pEgsmw?=
 =?us-ascii?Q?gWRvORJacxvykvDR7HeVaLeZ+VE28OtRgDUhhYhcZSc/MNLv/hxVdj+Vb6Ow?=
 =?us-ascii?Q?53JYGaBiJaZxG+uqFC2Qwna6arJdp5E71/UgF1FrqRmM406W/X+y08Hz+Lb9?=
 =?us-ascii?Q?rUw1tjhmhAUDt4U2QpMoo1G83YYFfhd4WCN+Dby2BbXSpxoYgrWPwJb/Qtrq?=
 =?us-ascii?Q?ngn/98wAuE7dS8Ykc8deIN9qdelFpd23SLoHNOIemqfXif09bbRodVtKJYMF?=
 =?us-ascii?Q?VGj9Mxqss3sAsMGUmgOGibxf4EvEUCLUKz/HyLdzX7cT6JEE1V9mBaYM3oE5?=
 =?us-ascii?Q?ffcBVQaEsj8PFcdqR6VIEJnkNz01QJGLhxoSVDguEQjsKjHaf3NrV88eqpiK?=
 =?us-ascii?Q?Rg9Xjx8o48e+y6BBrIVkXKQ=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ca7959d-a131-4128-b9fc-08da58d35d30
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2022 06:56:45.2883
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lQtjLjXmCpR2Qc+aM+ta4U4pi9Y+838USJQgvy1iqgk4pBhfMkBjF+dmWQ2/LOpOfAPjJkEzbMAWW3X/1aV0waBEhFOPy7bk9QjScSu3Emw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR10MB5978
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517,18.0.883
 definitions=2022-06-27_09:2022-06-24,2022-06-27 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 bulkscore=0 mlxlogscore=966
 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2204290000
 definitions=main-2206280028
X-Proofpoint-ORIG-GUID: t2J5r6Ps5d_Ff1qYAJe3otFjfl-nn5yJ
X-Proofpoint-GUID: t2J5r6Ps5d_Ff1qYAJe3otFjfl-nn5yJ
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hello Nishanth Menon,

The patch b09d633575e5: "rtc: Introduce ti-k3-rtc" from Jun 23, 2022,
leads to the following Smatch static checker warning:

	drivers/rtc/rtc-ti-k3.c:186 k3rtc_unlock_rtc()
	info: return a literal instead of 'ret'

drivers/rtc/rtc-ti-k3.c
    180 static int k3rtc_unlock_rtc(struct ti_k3_rtc *priv)
    181 {
    182         int ret;
    183 
    184         ret = k3rtc_check_unlocked(priv);
    185         if (!ret)
--> 186                 return ret;

It look more intentional when code uses literals:

	if (!ret)
		return 0;

The k3rtc_check_unlocked() function can also return error codes so maybe
this should be:

	if (ret <= 0)
		return 0;

    187 
    188         k3rtc_field_write(priv, K3RTC_KICK0, K3RTC_KICK0_UNLOCK_VALUE);
    189         k3rtc_field_write(priv, K3RTC_KICK1, K3RTC_KICK1_UNLOCK_VALUE);
    190 
    191         /* Skip fence since we are going to check the unlock bit as fence */
    192         ret = regmap_field_read_poll_timeout(priv->r_fields[K3RTC_UNLOCK], ret,
    193                                              !ret, 2, priv->sync_timeout_us);
    194 
    195         return ret;
    196 }

regards,
dan carpenter
