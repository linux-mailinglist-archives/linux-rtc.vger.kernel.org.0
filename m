Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A39C44DD34
	for <lists+linux-rtc@lfdr.de>; Thu, 11 Nov 2021 22:39:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234183AbhKKVl4 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 11 Nov 2021 16:41:56 -0500
Received: from mail-bn1nam07hn2228.outbound.protection.outlook.com ([52.100.160.228]:11895
        "EHLO NAM02-BN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234158AbhKKVlv (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Thu, 11 Nov 2021 16:41:51 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XzH7rfzOJP+CbWwrFGJPPD3tXPQl2QC3BNHo3o6PFAWG6NAFuHeuxJ1O9qY/hfjPHqRYEBtb9UCAFxQVG+Wh/NCAOOOAb6kcyra9Eq5BWYFQMLdLdbjvKgIHf0ehskS6T0VedaEjrxJGaW+batwQq+xpMOFIDyHL90VnAXUxlyDBs9HqV3f+SVWQHIEEqfpdRBJWCKOwFIuEX6kLNJeK5L1YCp59nxj/IAlEwB5aUIGqAtl1YY6dBFT9sZ7eZcUOY/1TrfbxPoJnhr7j4RGHBoBijvehX/vIIA62t1h8wDG6EWapfJphVXy+lLz4GJHVOaSYxuVziYqPpNgwnoBolg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3MXK+FxOVjHeM6e36eRvbA1WeahF9H4p3iMB/Gw0nxE=;
 b=BtRfuSaoxNUpEAVvfmc2YHXuBvUeb8cV/TYS48ikI7g49rZarMhwYPWkSYM+ODKFLeUp0ipX6e2H7dZr16/nPkd/h4mXH1PSIG7ZA+TjuF1rS5GVEt9IK9bvj0WTBsDNhr+gwvOUunUoX59m32JseSu0k0I3T2yiH7fgdQdruH4G3ZjKgqPT5Zkj/utJavmDgD40q8XwXWOGxrT4LfNe+4WcgH54gfSu/dGfj05Jz7pQkHCKA4CymaI2zF1/KyTab0sDjS1/MjGPUOv7ytJx9HvmqfZ6SzTAjWguEzqm3pya4mI8qxi9PgOvdqgOp3GRb8jlmJFT2oPFwZubTL0Lkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 20.98.130.93) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=fergtest.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=fergtest.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=assocprod.onmicrosoft.com; s=selector2-assocprod-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3MXK+FxOVjHeM6e36eRvbA1WeahF9H4p3iMB/Gw0nxE=;
 b=oTiqmg0hEU2Mfd2Ge/Egx3G+TWKcBjPwcAFGPtH+ecsAUXpBm3viI/R8+AJM05wmuvJe8xUG/dxO0Qwp3/U9AYQ/vRPaTfXDheEEIE/OAoj6m3czOO02PkOGqf7SpUmdqrMx2dbGFT+vigXj0RXbzgn4P1X5zZ+6oPcZuv8Yb84=
Received: from DM5PR16CA0008.namprd16.prod.outlook.com (2603:10b6:3:c0::18) by
 DM5PR2001MB1916.namprd20.prod.outlook.com (2603:10b6:4:17::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4669.15; Thu, 11 Nov 2021 21:39:00 +0000
Received: from DM3NAM02FT024.eop-nam02.prod.protection.outlook.com
 (2603:10b6:3:c0:cafe::21) by DM5PR16CA0008.outlook.office365.com
 (2603:10b6:3:c0::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.15 via Frontend
 Transport; Thu, 11 Nov 2021 21:39:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.98.130.93)
 smtp.mailfrom=fergtest.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none
 header.from=fergtest.com;
Received-SPF: Pass (protection.outlook.com: domain of fergtest.com designates
 20.98.130.93 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.98.130.93; helo=mail.fergtest.com;
Received: from mail.fergtest.com (20.98.130.93) by
 DM3NAM02FT024.mail.protection.outlook.com (10.13.5.128) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4690.19 via Frontend Transport; Thu, 11 Nov 2021 21:39:00 +0000
Received: from feiapmsgmailmx1.ad.fergtest.com (10.108.32.132) by
 feiapmsgmailmx1.ad.fergtest.com (10.108.32.132) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 11 Nov 2021 15:52:43 -0500
Received: from [64.20.61.103] (10.108.2.8) by mail.fergtest.com
 (10.108.32.132) with Microsoft SMTP Server id 15.1.2242.12 via Frontend
 Transport; Thu, 11 Nov 2021 15:52:43 -0500
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: Greetings
To:     <linux-rtc@vger.kernel.org>
From:   Cecilia Abrahamsson <sales@fergtest.com>
Date:   Thu, 11 Nov 2021 15:52:43 -0500
Reply-To: <mkt606606@hotmail.com>
Message-ID: <cdcd9d36-d3af-4296-a3a4-106c5ba6cf68@feiapmsgmailmx1.ad.fergtest.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 198ff0a1-bf21-459d-7524-08d9a55bac95
X-MS-TrafficTypeDiagnostic: DM5PR2001MB1916:
X-Microsoft-Antispam-PRVS: <DM5PR2001MB1916F602F0C9EE8875BACF24DD949@DM5PR2001MB1916.namprd20.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?XoIaDnN+sbngqR03pByusyQgGoMchecgrjC1n34ryuozC9qVz4OPKbLu59?=
 =?iso-8859-1?Q?9C5lbUpVNatUZmuzozSXxlYA0zYhCNKAPRycsu6ppRPt9VtxefCbNCC1yn?=
 =?iso-8859-1?Q?tKAlYbjrYenrv/14Z5oDsOGLA/u4LcDPGHIs/3wI4nzCPCr9XJpUlCyB4x?=
 =?iso-8859-1?Q?FG9NA31hgK9fppZNLnFMaqvFBCEaqcvU+yVC8QI/J/7IfnDzjqDq6HzP1n?=
 =?iso-8859-1?Q?Xq3Q5k8atA1V+teaAbx+cZClTdXkIzPHEl7yVjGmduCv0xdmpXpqPSsQQv?=
 =?iso-8859-1?Q?ef/Q5dJWo+IhWDYi4vUDNncoE1dCi9PzzGiT92AuihSUdNTt93mj7StJTI?=
 =?iso-8859-1?Q?werrIoGA7DS34x0emah0RUIfTmsCRLPwamBBTFqKTwi93lcu9Vr1NOOD3W?=
 =?iso-8859-1?Q?t80SMMRRgdbdZ6KcdsESsNVHpTCmm/0/bgMIj9Z4UQTvRVeTodMA2vcPMn?=
 =?iso-8859-1?Q?yzXVP2KPJldkyPAjKqDrSK7cWnPfPIbvM5MUOod2oobKpotbpM8AnHem7V?=
 =?iso-8859-1?Q?h2knlnhQjEZefVmEnELkkRfALwrYNYw4t2kVhrUFwLVbjt4/iSLQUGyaa4?=
 =?iso-8859-1?Q?IOqUNiel/PHhPCjvT12fz1gPIrpL0Hp6J2fhEKAOCSX17eTNf/rgpj+5IB?=
 =?iso-8859-1?Q?kdEdgpzA1bxH0b1oW+ElZuevg3TTA8U+xVUPQQ7LsikEFXLITlChkkFv68?=
 =?iso-8859-1?Q?QYpxpj3nBHIokTItDCcBpaW7T7CgqGjPZQ10bDPDiE4iYHU5nOXLLBnawX?=
 =?iso-8859-1?Q?nmttX2wGrG/sOu63HyyhMGyfvQKlAbgLeNIn6fTPMHLymCS0+eZ/5DS9C3?=
 =?iso-8859-1?Q?Wv2SkX2cKee0g9M5GG5SBSRl5u/20m9WJgAWdbQoqnpFSomxzWtqI5yAv9?=
 =?iso-8859-1?Q?HEQcC3m9uMrSCn0cZ+6yyDhw1Ca7Ohe8DjbRShO27GYcXJJU2pZXEYzRbK?=
 =?iso-8859-1?Q?6XQHt2Twc3tK4v769sfaIya1Z6yodIz697+dfdOpAIxxbJr5WLAR4Q/A5g?=
 =?iso-8859-1?Q?G5AXHisLNoM57gEh5xbA+h2qa0kqV8eiS7PM+JlwhYZGV+8/o/8KFrRhPQ?=
 =?iso-8859-1?Q?k+3kn6jRs5YDGRJOjtZg+7c=3D?=
X-Forefront-Antispam-Report: CIP:20.98.130.93;CTRY:US;LANG:en;SCL:5;SRV:;IPV:NLI;SFV:SPM;H:mail.fergtest.com;PTR:InfoDomainNonexistent;CAT:OSPM;SFS:(4636009)(136003)(376002)(346002)(396003)(39860400002)(46966006)(36840700001)(36860700001)(31686004)(316002)(81166007)(2860700004)(82310400003)(16576012)(6916009)(956004)(8676002)(8936002)(508600001)(186003)(82740400003)(26005)(86362001)(356005)(2906002)(5660300002)(426003)(336012)(70586007)(31696002)(558084003)(70206006)(47076005)(6706004)(7116003)(3480700007)(16900700008);DIR:OUT;SFP:1501;
X-OriginatorOrg: fergtest.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2021 21:39:00.5348
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 198ff0a1-bf21-459d-7524-08d9a55bac95
X-MS-Exchange-CrossTenant-Id: 11d43234-e369-49f6-862f-13d512425495
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=11d43234-e369-49f6-862f-13d512425495;Ip=[20.98.130.93];Helo=[mail.fergtest.com]
X-MS-Exchange-CrossTenant-AuthSource: DM3NAM02FT024.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR2001MB1916
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

I hope that you are at your best and doing well. The purpose of this letter=
 is seeking for a pen pal like friendship. If the Idea sounds OK with you, =
just say yes and we can take it on from there. I look forward to hear heari=
ng from you.. My name is Cecilia Abrahamsson. From Sweden

Cecilia
