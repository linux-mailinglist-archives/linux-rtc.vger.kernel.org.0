Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9B4643B804
	for <lists+linux-rtc@lfdr.de>; Tue, 26 Oct 2021 19:16:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236314AbhJZRSg (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 26 Oct 2021 13:18:36 -0400
Received: from mail-bn8nam12on2081.outbound.protection.outlook.com ([40.107.237.81]:37408
        "EHLO NAM12-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230160AbhJZRSf (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Tue, 26 Oct 2021 13:18:35 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U7nGfKuCUoR8gITvKnzRgKL9eiCeO0z7zJCivTMxIrbAUNFEL9+6v5FCXdB1w8/LgeuYLKW+bbbbn5itc2e17pX94ToFpU5T7ufkf4i4N9CEJfiwyi+reTU1u59pUCR3ylSejRKFEVqvil4Uu51UGGkxiY1HsAeZUPTeco06K+HzDUsTHML8xrsas1jw5mbxhdk68Fy/ajLFQKqeGoWGV1WlyfXAEANxb8odH4IhYZdK+68xJs2HWuw5gdt7FtZU4lmZNGqIYrwg0WAO6IVxb8prt/1bXUvR9/0MEj8CzVkPrZ/u1zXoVqevA1ASGkCvl64KVz3BAgfCUT24immEOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bd23oF1Jzyu3gs8pp+2f268Zj8C63DdO8v5nwn2HFjI=;
 b=O//cmXkvivQ8nEpcHrTHPuwRauRuprt5nn45uJ/bwXfUV1MosYuWb/JO2AmG+7xxc8QSD+YtgOMo7JpMXyOxAta4zxl8S6l6YHbiEOBCDyAG9ELrybWxR89eOCk14nCPVPZ5QlIlwvBwxIgaPWTyUQqQpG7kXA+YSap/OLBkEI1GanrbdQe/NEn9783Rsi+c+S8UYKK3Ukip9NyvuOxV7UB8Vmq0yHLHmaayRudqZrc4xPQ8nH0dbtINlplEBpGXNTXx5SyyRs84FlUFub6EFWiURcNfiEIU7gIZhxfvwqsmufGoIIlb/hJKBZ3zVzyEASOiLJ1a0TCB3cGy9KK44A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bd23oF1Jzyu3gs8pp+2f268Zj8C63DdO8v5nwn2HFjI=;
 b=3RngpSCqiBFVJh+YZksne6ecOAeoMJqiG2dWMi5rR4A0gYs5CI1MbwvxYGmIZvZ3uu1qOqxsHMBO42QUpP+pZD7NFUEU4leiEWn6s/sewP4sMJ4zkD3amgbUw/c1A/TOeVaLu4ghIJ/eVfGiYkFjX1PabegipMbrQ+AdTk6KkyM=
Received: from SA0PR12MB4510.namprd12.prod.outlook.com (2603:10b6:806:94::8)
 by SA0PR12MB4509.namprd12.prod.outlook.com (2603:10b6:806:9e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Tue, 26 Oct
 2021 17:16:10 +0000
Received: from SA0PR12MB4510.namprd12.prod.outlook.com
 ([fe80::f909:b733:33ff:e3b1]) by SA0PR12MB4510.namprd12.prod.outlook.com
 ([fe80::f909:b733:33ff:e3b1%4]) with mapi id 15.20.4628.018; Tue, 26 Oct 2021
 17:16:10 +0000
From:   "Limonciello, Mario" <Mario.Limonciello@amd.com>
To:     Arnd Bergmann <arnd@kernel.org>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        "S-k, Shyam-sundar" <Shyam-sundar.S-k@amd.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>
CC:     Arnd Bergmann <arnd@arndb.de>,
        "Goswami, Sanket" <Sanket.Goswami@amd.com>,
        Sachi King <nakato@nakato.io>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] rtc: x86: amd-pmc: fix build failure with
 CONFIG_RTC_SYSTOHC=n
Thread-Topic: [PATCH] rtc: x86: amd-pmc: fix build failure with
 CONFIG_RTC_SYSTOHC=n
Thread-Index: AQHXynOlL4xbtq3zT0u7Kq5n+1rZF6vlhUTQ
Date:   Tue, 26 Oct 2021 17:16:09 +0000
Message-ID: <SA0PR12MB45104F8E817E561DF93CAC23E2849@SA0PR12MB4510.namprd12.prod.outlook.com>
References: <20211026141317.2999103-1-arnd@kernel.org>
In-Reply-To: <20211026141317.2999103-1-arnd@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=true;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2021-10-26T17:16:07Z;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public-AIP 2.0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ActionId=359186d7-26ae-400c-961e-f721eb8674b2;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=1
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4f98324e-c193-4115-b0db-08d998a44e06
x-ms-traffictypediagnostic: SA0PR12MB4509:
x-microsoft-antispam-prvs: <SA0PR12MB450953232ABD68996A5CF458E2849@SA0PR12MB4509.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: co/RsFi21Flc19EJKdpaiFJd+TnGqPAahpWcN6Zh0vYJMwp25sj3AEmdPJEupFoS+/7hVg9D8p1938cTqnXqCEsdnD++NmbYyRJpLO4CU3d7NSarVNPYaKKfZD89P5D1lo9S7BbhlDWrUz51l9G3omucsSY/yb9UbTb4BhhZsxsdo7THvPR9w3CVLNXJ4Kb8zeunarXDYl0HPD3pk3zwlG31Zfus1vxfCgVtkMsh5NE+uTVC/A9jZ4k95egxZhTF8wqCU39PZBcUpwGAHZFHaT/sQuFFppBZqeSw+/FmQXAmBSIt/QHJYd4GGuOqKgQWFU2R2tzbkC3K5wWjZnf/AdrUjxVRvQMw9ankv5L0dfGQzRSbVIN/zhYOyxVuUsV1gK7OO35zzjONkiBTk9Ftw8Kmv24FsCs818RIL7UWuA6HL+iMMxfVORIXMGSq41DGhDw/xhTV5tvskWnMNLqU/GXmAhsDprbfEwmXQcVT4yfY9i0dM3rFXRgYG0xI1PSyss3ffRqkMKO4RLbH/rZtU8HqysCSt7NMrybPsHjwLvghrqLvstaolBmzb6bi9CaetMKGVTZ6VvmUzsTMWmIejvfEYXShlLrvb81W7QB349KBj0FjQ9LUg7KHHC+mkxgPgH7t5uCiBVvFHSKZBWq5xWM6tCORHfKPLhZXxslTRrri6I1k9t/NpNVu1j69CFrpNTbjboLFHcjHzQ77lgndcw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR12MB4510.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(33656002)(55016002)(8936002)(2906002)(52536014)(66556008)(86362001)(110136005)(83380400001)(66946007)(64756008)(4326008)(122000001)(38070700005)(508600001)(316002)(76116006)(54906003)(66476007)(66446008)(53546011)(5660300002)(26005)(6506007)(186003)(7696005)(38100700002)(9686003)(8676002)(71200400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?QTZIyISSuOTQPF/eCD0lLbcyW/DO/mFkFxb042FPi9vPBLbUIUGIDnYijix7?=
 =?us-ascii?Q?UNh+12w6oO4SAyvK6DRpRJ0qM0faT18/s70Q/MfRYyQLSUJmZgzRIvKVFGTA?=
 =?us-ascii?Q?Ou9hTOxSHPUy8ZlknGqPKoRa8BMlPoeCpUUvc4N5MtKQPhmetDJ5IeKcwiwm?=
 =?us-ascii?Q?u7PHzWAoNkHMS3i8nectPt1lNoZg4JC+U69SB0cvJqySGgYD2IBcr5fv8cx/?=
 =?us-ascii?Q?Seln5UQRGvhIxkA03kw69WE9f0Q0g965uBOyNbbVeq0q3K5c6r1hpl0nT4E2?=
 =?us-ascii?Q?7BPig1nNoJUyjHlI4jcu9DxUpu8RxDMj37hpoVUenUqkc9P747Jpe8ataGty?=
 =?us-ascii?Q?TEfppzcnKGqWOmbbzz95KWudso7nwIF6bojS3wpShXWD/W7n2iq0gGzyvAYR?=
 =?us-ascii?Q?HA1GUSXB7a78cFd+/9aVFei9fWSrU0I1Om7S30apmIsoYbuDrm/MaxRMJGpF?=
 =?us-ascii?Q?8dfGoBsXx6Gqs5Z/6u8Pg3Nau8YNcHnO68f+AJg43v9p8BR95Q5UwT1CZr8W?=
 =?us-ascii?Q?2jav/cGrf7rHXHuuuJ/3XDUCyNO9AMymMwyv0RAktxKuJL62UQc24cxteyQ2?=
 =?us-ascii?Q?djgMADcN0SsP20bCViKkOZg1SoGVGMXEQ8lpYTI3ROf2JjWb3jwwcs82L3yY?=
 =?us-ascii?Q?JPVz3TB7+YtO+6F+Ww2rjfTANWSq0fqqRCkaWTvzxo4rIBox9JSHcwBCTJ6U?=
 =?us-ascii?Q?JRh04VtZbURF5vnhJaWYzh0WWw7R6dV91xRuUg95+XQasKqW+GJGrKDNR/TN?=
 =?us-ascii?Q?iQD5VRduoH1quEurEEOLehmoYeh8EuUUyNntkQrHRBGc0frqOSumJgVIMaDd?=
 =?us-ascii?Q?cxj7aEIpE9dnro95kxmcv5QKcqWKCa7jcDkfb+BhyZ+vtdZY8e15xIYufIc4?=
 =?us-ascii?Q?zzT/54fDQ4s8cXwNW0Ylnow0Gou2DlS15Gw5l0NYWAWxV70Uk9lnhruvZNi2?=
 =?us-ascii?Q?RrytP7fsBm6SlQfvwv0klybu9dFb9Y4YCL/L+IYbgK2R7AR8wSZwj+30eXiU?=
 =?us-ascii?Q?3rC8V4j1jHl/LEpvhcl4VU87PCunTZX8CqZjbiM7alk3oEetOSk8efHTAgOC?=
 =?us-ascii?Q?w3f5HmXe6qdPqyZJWMJ4z3B/2lKCR63k0GR1cXBVzqoTJ4XKjwmI48i4r6/t?=
 =?us-ascii?Q?lQywPvYPFOVu6H0bXem/tVVPgFYhpU7z1OIjquHki87RYiRz7u0nTq2avhbH?=
 =?us-ascii?Q?x96fsgBTkwB0Z25r5iwbdR6GeRr57ofoJlM9E5N37evbrFhPnWNuMCbC0ew/?=
 =?us-ascii?Q?xYwH8FzyWm27uC3U3ZlLt3MJONikPewbgoY1u3Ywy9CqPVBUYHKixhW33dOh?=
 =?us-ascii?Q?EtITsKBJTa2AygjthKCWWGspFHAjLP8D3/YCYE5tjjWnbki2fXWjmswolps+?=
 =?us-ascii?Q?bBWQlaRqiv7DMgbwnUA//1LHmkFyXqcZEJXEMFJAO8DB+wpJGwmm6VFtoBoK?=
 =?us-ascii?Q?KpU/b+6GuUhb8PcN2166Dbp0wuuJgLK7dCW8w/x9aSiCEqvIxzCVAPNlaXOE?=
 =?us-ascii?Q?YdVAKYJzikeRSce/MEmlolMpQO5a2+EIYkvU/2Fq+LmGkTTbp293AGCBfasp?=
 =?us-ascii?Q?lkPWpPlqfV7NbZ/kIyeGJjJlowgVVQyTdPBQk8wPIIhNThm2uFXzuFTe8YfJ?=
 =?us-ascii?Q?UBGtcV/OnRA5aIM4ysJlj2o=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4510.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f98324e-c193-4115-b0db-08d998a44e06
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Oct 2021 17:16:09.8834
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eS1Z2d/SXU+612w2Y0PJK6ziRgfFyZz0aG1ZQL9Fuvw7XOyBg2C61INfaAEDUSU0RI11F7JZ0R2SO8CzPmnv6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4509
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

[Public]



> -----Original Message-----
> From: Arnd Bergmann <arnd@kernel.org>
> Sent: Tuesday, October 26, 2021 09:12
> To: linux-rtc@vger.kernel.org; Alexandre Belloni
> <alexandre.belloni@bootlin.com>; S-k, Shyam-sundar <Shyam-sundar.S-
> k@amd.com>; Hans de Goede <hdegoede@redhat.com>; Mark Gross
> <markgross@kernel.org>; Limonciello, Mario <Mario.Limonciello@amd.com>
> Cc: Arnd Bergmann <arnd@arndb.de>; Goswami, Sanket
> <Sanket.Goswami@amd.com>; Sachi King <nakato@nakato.io>; platform-
> driver-x86@vger.kernel.org; linux-kernel@vger.kernel.org
> Subject: [PATCH] rtc: x86: amd-pmc: fix build failure with
> CONFIG_RTC_SYSTOHC=3Dn
>=20
> From: Arnd Bergmann <arnd@arndb.de>
>=20
> The newly added logic to set the RTC during suspend from
> platform specific code fails with a link error here:
>=20
> drivers/platform/x86/amd-pmc.c:428:30: error: use of undeclared identifie=
r
> 'CONFIG_RTC_SYSTOHC_DEVICE'
>=20
> Add an #ifdef so this is only done if the functionality
> is enabled.
>=20
> Fixes: 59348401ebed ("platform/x86: amd-pmc: Add special handling for tim=
er
> based S0i3 wakeup")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Hey Arnd,

Thanks for the patch.  We had discussed this a bit already and there are 2 =
other ideas
out on the list already that also solve it.

> ---
>  drivers/platform/x86/amd-pmc.c | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/drivers/platform/x86/amd-pmc.c b/drivers/platform/x86/amd-pm=
c.c
> index 678bf6874c63..8bd5de4d9d3a 100644
> --- a/drivers/platform/x86/amd-pmc.c
> +++ b/drivers/platform/x86/amd-pmc.c
> @@ -414,6 +414,7 @@ static int amd_pmc_get_os_hint(struct amd_pmc_dev
> *dev)
>  	return -EINVAL;
>  }
>=20
> +#ifdef CONFIG_RTC_SYSTOHC
>  static int amd_pmc_verify_czn_rtc(struct amd_pmc_dev *pdev, u32 *arg)
>  {
>  	struct rtc_device *rtc_device;
> @@ -461,6 +462,7 @@ static int amd_pmc_verify_czn_rtc(struct amd_pmc_dev
> *pdev, u32 *arg)
>=20
>  	return rc;
>  }
> +#endif
>=20
>  static int __maybe_unused amd_pmc_suspend(struct device *dev)
>  {
> @@ -473,12 +475,14 @@ static int __maybe_unused amd_pmc_suspend(struct
> device *dev)
>  	amd_pmc_send_cmd(pdev, 0, NULL, SMU_MSG_LOG_RESET, 0);
>  	amd_pmc_send_cmd(pdev, 0, NULL, SMU_MSG_LOG_START, 0);
>=20
> +#ifdef CONFIG_RTC_SYSTOHC
>  	/* Activate CZN specific RTC functionality */
>  	if (pdev->cpu_id =3D=3D AMD_CPU_ID_CZN) {
>  		rc =3D amd_pmc_verify_czn_rtc(pdev, &arg);
>  		if (rc < 0)
>  			return rc;
>  	}
> +#endif
>=20
>  	/* Dump the IdleMask before we send hint to SMU */
>  	amd_pmc_idlemask_read(pdev, dev, NULL);
> --
> 2.29.2
