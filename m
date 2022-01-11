Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79D7A48A848
	for <lists+linux-rtc@lfdr.de>; Tue, 11 Jan 2022 08:20:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348475AbiAKHUH (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 11 Jan 2022 02:20:07 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:57454 "EHLO
        mx0a-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233597AbiAKHUG (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 11 Jan 2022 02:20:06 -0500
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20B3TJkX022671;
        Tue, 11 Jan 2022 07:19:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=TvdQb23R4+kdvV7zq2LOWfvTZD+wlNDSUtuQ9bzSrHI=;
 b=jYMFWZ/f79XEo7qVgGy2uT31QNtyLIL+XiieGR3jCf/xkTtDni0aocfUuG7gn/HxdRD8
 3pij7GoVxcSIhKNLnY28ytlXw6cXuEVAU0Djw2rYbkClZ8QuAPNvS4Le0j7Tfk63G8xi
 uVo1tnhmbvyT/E1Yx/AKfjND71zttcdcQ+GzdNTEi6h/nPTmyvGcJiK6X99ye7Moatvj
 2RljPSNia95NwtgYYH5eIrlm9xtbel5UTNyV73tKHmivzA89npLZ7VNWxcaB5P0rsDPV
 MdtDUx8McijuB/0Nod8k10bACr88aci+s4/NCidM2L+pzFdmnQTBxHmxjLdfc1yyWfl/ jA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by mx0b-00069f02.pphosted.com with ESMTP id 3dgjdbtmhk-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 11 Jan 2022 07:19:40 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 20B7Fb2u146884;
        Tue, 11 Jan 2022 07:19:38 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2175.outbound.protection.outlook.com [104.47.57.175])
        by userp3020.oracle.com with ESMTP id 3df42m8bbd-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 11 Jan 2022 07:19:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NAHfAyCZ6g5iTbMW+UqNr42vj1cqs8HR/Ma1sIQS/3tfwsGXHvfkahfuWgY2Mzxcv5O6d4f52MDFq/eM68KR9/MikuWmal+Y7nxrLiOAG6sUrqCIlOjgD2tnnFWDYgEbR4NKwiheR1x1FwquIbweb9SFZuxWSVS2z4cB23MxIeVP5gMurAv8rzuImFiFoYVw8WVeoTefHiXzG7n0ADklwmho4uhhvGX446stZIevw9Sz1/JP20g+2KSDS9/FByfXheaH8sw9Y0hvrua0IOoICfAun9uhqWh9n+Lx+IwIm7Gy1OuNbMV8r5xzYVby6KBg19ApncnNqmKx7eU7zetRVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TvdQb23R4+kdvV7zq2LOWfvTZD+wlNDSUtuQ9bzSrHI=;
 b=JfT8K1uTMU32fUPtgBX03KVrr1C+1UrDID0slmQvGHjUlXdyaRnJYAG+OYg3rEBM19AfCU2lsmKy0kqdSl2PUysS+mNBt3VzwaR9vobVhhV7MOkY/C6TWMORbGzR4UmnbFm6P6eONfNt034uGzRJ0/RbKGKm2tYyhC9brLaA8Bfla6rIFH5D5jKUq+2kbsn8XfwhFApua/zSaNfaNe5LdGbdSxiWK42EDt9xd2c32g/+JBVyEzRhjrMPpQyzdn7idpLpIWMFtKUooYMl7yPj5s068w+AQpLcr7+kv8y8yCuhaVplAHVsGXZrSsMniI1OxQhaljXBBywi6ya81u5BBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TvdQb23R4+kdvV7zq2LOWfvTZD+wlNDSUtuQ9bzSrHI=;
 b=J1h2pyfelvuDCYLjb1bN0h2YkPBk+/cg7E5pEddq+HA72/3JwpqlHgeQSe0qriutg51DmWyuql064UiGr8d8w20cFrRpOUZ1YZ6FMcDaZ3aMg9LopBpmGX9le7HsD/ZVTy0t1gdZ30TwZ2vkjfFGUqh/gHzN4OSEsqqUByqQSzo=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR10MB1421.namprd10.prod.outlook.com
 (2603:10b6:300:24::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.9; Tue, 11 Jan
 2022 07:19:36 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::b889:5c86:23c0:82b8]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::b889:5c86:23c0:82b8%4]) with mapi id 15.20.4867.012; Tue, 11 Jan 2022
 07:19:36 +0000
Date:   Tue, 11 Jan 2022 10:19:22 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Giovanni Cabiddu <giovanni.cabiddu@intel.com>,
        Mateusz =?utf-8?Q?Jo=C5=84czyk?= <mat.jonczyk@o2.pl>
Cc:     Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Marco Chiappero <marco.chiappero@intel.com>,
        Fiona Trahe <fiona.trahe@intel.com>,
        Wojciech Ziemba <wojciech.ziemba@intel.com>,
        Tomasz Kowalik <tomaszx.kowalik@intel.com>,
        qat-linux@intel.com, linux-crypto@vger.kernel.org,
        linux-rtc@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] rtc: mc146818-lib: fix signedness bug in mc146818_get_time()
Message-ID: <20220111071922.GE11243@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0036.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:1c::23) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 91bc0f5a-3e63-4f0e-7252-08d9d4d2b904
X-MS-TrafficTypeDiagnostic: MWHPR10MB1421:EE_
X-Microsoft-Antispam-PRVS: <MWHPR10MB142113D143CA2D440B4E975E8E519@MWHPR10MB1421.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2512;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TWSVB2rRYRA39e5WxUG2hbp+wa3LU12fEUEP35cok8Frf6KQqknx8PQAxeiKXow2/UV72CqnSVfKnwPJJI2NFZxcUGWsXNNOrePNNDTOblAjPHNfOw2OK7lYOF6voxL6a4azk4aBZYxXAOgIf/MeQQ8I/J9udfn8jo+Rb+hrCdvXC5dpSiNoWNBE3HcvKVSc3bZ+5mbTus7R/WuL+QXTcqbPSD/GRkSZx7ViXTB+n0hTRNCu/+rvMB3tZu2MTQoUk0zEVfT3ynxnGHcxuaddySZdtPYiMyVawA1CaE6Gh1HwXs4Tq117qSr/jgZtZAXuuEC0r7V1WB0qBpEV/Rr5gaW07t9blAkefpwkFMj86JTktt8bZg2flsmFJ8JxOCUFDTvg3CwydqdHCA47dvdKmoCbL7tKTAr6K+zPKp1v+Xm28uLaz3t+oYBo4X8TWNSLQelFfZsn3esIHhWAY6woO88KOYLXPkwOtTcx74CgLueuC9/mxSJrbn9GrNsjUAtmB6Q7rlYrBZTIBdrz9fpNMfWkWw74y6NhHe5I628xGlQyhCIg5QSOMh4qRjmDnw9qUgDSZGlnM+64eHs7uOOZFxqTCF9n/gaJKb8+Vh34/0G5S9ihCg3VcIgHYhj7QoreRjOSL5GwdGnEJSiv+Cz8c9YmldJU5n8HdK6H6Nvq/oM/yIyqqtuNErV+f6HLTX9aJWy4cqcysMGARDVQfTpbyw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(366004)(33716001)(508600001)(44832011)(4326008)(52116002)(86362001)(2906002)(186003)(8936002)(54906003)(8676002)(6506007)(66946007)(66556008)(316002)(6486002)(26005)(66476007)(7416002)(6666004)(9686003)(110136005)(1076003)(6512007)(38350700002)(5660300002)(33656002)(38100700002)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?E4W9pWZq0ppmeoQCZ8Jn2r6ap6y4LhCaRFqxpc8x7LyKLgFrrAX3dONom7W+?=
 =?us-ascii?Q?Nwbors6O8+wFv75HCRM4+L5MmP5lcPtZvqZchW+F1EbnTCM/fe5DhbsjOVwI?=
 =?us-ascii?Q?eXcQ8hIFOxbGci6VkklQsxF9mCbtuhVum8QTeQ+dNv/mMYwa3GS8tSRr6MNO?=
 =?us-ascii?Q?3w4gY+2zwPRxt7kUa5CkSlAyNtWSizO4HsxGye4nnyhStHkWH38y0XSEkq/B?=
 =?us-ascii?Q?KC1rpFOsNdQGpdHaOu3CI4v70lJsGvjHUj+QT+S44DAU17+qAHoYAWdxB1/D?=
 =?us-ascii?Q?rnTs09Rboie8JxgxItbThssXD1l+7n9+e2ijMNXe1sdxd6wveH5L09QcfbkN?=
 =?us-ascii?Q?1nc6w7ci5zTL2W69pxjp0I+4Fw6rwhl6WasMSasYpedsnypvZmUxxNatK3wR?=
 =?us-ascii?Q?HFsjBjWZ3/HIQrj90F0LrdRJOtOUec55JsDeWmCIMnaVT7EH5m3XhyYMYstb?=
 =?us-ascii?Q?cwP0+KgQGBBw/QSy4RCJFLFltRE4MMzXZf4tbVBSyM99JRx4qwif3rmzAjNt?=
 =?us-ascii?Q?d0XHTxncB3yEWLcc/SfUz1oZIvrOv8SDk8uQMqJ36uby00QBJ6x+2lRM9G0A?=
 =?us-ascii?Q?jhPvzH0jYLmWH4lYHFrqcgMzt//FXEOHc40cLVb5j3GDu8MEoo/ZVpp9o0a5?=
 =?us-ascii?Q?LkNgRshbSCC0BQYdvYDznYv+RmgAX94p6IFqS2UumdIq/v1pc7dLfFQ4Cuw3?=
 =?us-ascii?Q?exkXT3oGNX1isjq7dFVL7xmxzLxI66yC/mDYzd6da0h0tUPz7ScyaNvlFk9Q?=
 =?us-ascii?Q?KxDbXTX2O0/H3paLRjrhz8YgZ17GE5yMq1xBE/Vrjk8QASInp1JlXPZD/pSY?=
 =?us-ascii?Q?Y/yjQaxl7CPX6Qp3HWk7P1cJYggOQh19BU/+k/YDCPHGx3EyLS/+8yxCRN2A?=
 =?us-ascii?Q?mz3T4sGw3Vy63PB+vkfZkL4M2khMJN0sUMhhJYSclNvnoVY9o6vAxO6/iEfX?=
 =?us-ascii?Q?8zK+5QvCKr+dETysp/nC5a2/brsonuKnSVIikou+xZ/571lkLyKfDd/N505b?=
 =?us-ascii?Q?ym1zWzdFT5S2VJTC0iZ4aBTeCxItuPZL99+0FHoUe0dRVOz1Ix6kUQ9tE1EB?=
 =?us-ascii?Q?d4pNyCrdg1TaHftS64xGlDl30Im5WlpHOlKXt5i0uD2X7ZfgvX56YLkuOPXq?=
 =?us-ascii?Q?PbuSEDQkLKh3nro4DGHEbcMHVkOtTpGjjjEZAVGhtyNruCR02CUE1f0YufsR?=
 =?us-ascii?Q?BGLxKc9nVnqWWwi79ulwalSPfyESpjgAvmyqKo9SLlL2ajJ2v14+fRcLxk0t?=
 =?us-ascii?Q?9dW2Yh5AANfAIoaI1D58bKsd+xIwdz0k8T7ZfmmVa/kZkRG+yJ1t2JAKzrXG?=
 =?us-ascii?Q?iO1JfL6mJ/fkaFUyuNP8XKrQ593XNKWi0CV+M+8ffZgHa04CpH+z69PHt3eO?=
 =?us-ascii?Q?W5vK1F4KlBjeJRfe8sGIFfLF5Kx1HP29GTNH+9BeRXJoUNKM94aujj4/zsEJ?=
 =?us-ascii?Q?H2DK2smBuUD58ZIT9WLglQTQUlDnaFv4GniTZsDQEcCMcCR/hbxZ+jal8Mib?=
 =?us-ascii?Q?JU43pKNhLo6M2CSgopxy9kL3Ld7zm9a244PMfrj03qu/jHdzjOCX3OLznjZA?=
 =?us-ascii?Q?WnomInrOUsyY4HlOW9c9Rd3ZYtJfjB73xasxiF292uSaW03IrL51ZYdtw0Rl?=
 =?us-ascii?Q?oiMH1mD3zUfNRRZOp05WtuagEwk/l20Xg9z9jqxewD43dfJChQ7EJhPBnNAW?=
 =?us-ascii?Q?weuB3l78enElpacUsa6tHs9MUCo=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91bc0f5a-3e63-4f0e-7252-08d9d4d2b904
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2022 07:19:36.4432
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L4DYtMoO1hMkXy+rokOEsVZ3XBuR/KsVyJSiBiBL0R6K8YFLPcpVJiMa+2IiikQUAH6q3KHHGqecXNieEDEsxFq1g41VkIvIEMpKQ8gXae0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1421
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10223 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxscore=0 phishscore=0
 mlxlogscore=999 spamscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2201110039
X-Proofpoint-GUID: OyQMVpgJZTz8UG0jDDERFRYkcmmEHKOQ
X-Proofpoint-ORIG-GUID: OyQMVpgJZTz8UG0jDDERFRYkcmmEHKOQ
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The mc146818_get_time() function returns zero on success or negative
a error code on failure.  It needs to be type int.

Fixes: d35786b3a28d ("rtc: mc146818-lib: change return values of mc146818_get_time()")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 include/linux/mc146818rtc.h                    | 2 +-
 drivers/rtc/rtc-mc146818-lib.c                 | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/mc146818rtc.h b/include/linux/mc146818rtc.h
index 67fb0a12becc..808bb4cee230 100644
--- a/include/linux/mc146818rtc.h
+++ b/include/linux/mc146818rtc.h
@@ -124,7 +124,7 @@ struct cmos_rtc_board_info {
 #endif /* ARCH_RTC_LOCATION */
 
 bool mc146818_does_rtc_work(void);
-unsigned int mc146818_get_time(struct rtc_time *time);
+int mc146818_get_time(struct rtc_time *time);
 int mc146818_set_time(struct rtc_time *time);
 
 bool mc146818_avoid_UIP(void (*callback)(unsigned char seconds, void *param),
diff --git a/drivers/rtc/rtc-mc146818-lib.c b/drivers/rtc/rtc-mc146818-lib.c
index f62e658cbe23..7f689f1bafc5 100644
--- a/drivers/rtc/rtc-mc146818-lib.c
+++ b/drivers/rtc/rtc-mc146818-lib.c
@@ -130,7 +130,7 @@ static void mc146818_get_time_callback(unsigned char seconds, void *param_in)
 	p->ctrl = CMOS_READ(RTC_CONTROL);
 }
 
-unsigned int mc146818_get_time(struct rtc_time *time)
+int mc146818_get_time(struct rtc_time *time)
 {
 	struct mc146818_get_time_callback_param p = {
 		.time = time
-- 
2.20.1

