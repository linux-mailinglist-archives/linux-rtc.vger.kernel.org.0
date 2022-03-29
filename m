Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 246944EB4BE
	for <lists+linux-rtc@lfdr.de>; Tue, 29 Mar 2022 22:36:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230075AbiC2Uii (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 29 Mar 2022 16:38:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229612AbiC2Uig (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 29 Mar 2022 16:38:36 -0400
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2072.outbound.protection.outlook.com [40.107.94.72])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92F16443DB
        for <linux-rtc@vger.kernel.org>; Tue, 29 Mar 2022 13:36:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nzS+DLNMuIFd0BuiOWa0O+KhXvT9K/dxQiqx9mcOSoZV5oeBDIaLeRc3VkdBrK7DxQBDOz8nW+R6WDDDShGCCb2Ev6Lix88q31B7rXPz3DWJX3jT70rAzxk8xmCNzEq/yuaKOJxT3YCbicfVE07L4jS9BoOzc6t923JRxtMtPLE3xL0+wWkG182MXIuJuU4s6QuzJzlJ4fKwMxjYeB7GpwhUZwW0c1gxXWMCmqLW/geXwNh5DUIclzvZ69BEIRMyr7fBWDIC9kqIVrBfEZExbbaVQwsIvveOTSpECAxYd/9XpskMz/VTJYx8cWup0zslidH2KlYDSbKv7ujQ7I7qeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5jgf6DU0NOP4Qr929WUgvWZuzijSel0ukXW73llWDvc=;
 b=HxEfKzZRfMahtXjUlDUP+5wdgiliYSIAGonoxoAl4CDQtDcAjkoFaaqB94MssdvqKReDcAsjbmade1qHoZ8xf2GV4pZKey7DlsJBWwLnGak0Cc4dfyZhIkLu5dq0skC7l/aJkXJTzjuM56D4ZU9kFPOQJU73gwiMtD9FA0PaNei3Mh3UwEcLSTxteqmmfN7U/18n5y+/kiNNJxULzCDOVboO5VVCV/1ystNVnA/wmDiP499nehvlv91LLZr+4LjX+f5GwA1yNbiphk9z7/GxGegh8j+TanSg8oeOravYGvIMcJHxkpOn8WnYjXFUgCkQS111ibPyi+HO1Ux7LgTkwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5jgf6DU0NOP4Qr929WUgvWZuzijSel0ukXW73llWDvc=;
 b=I325i3Qzs81/LvGUa8A8xVy4bpyxcuAV3u+aLuti7iDfqBJM5BcYhR2sZBjtM7uoScireWYfgwGq7WuOvozn6qixxbTEvIK5saeuz6H/jali2tW+bfwzD2RMXfml59FLcHYAyYoFfZmpWHXh7CY4cqqRswyeGqWde2lRt6nhkYk=
Received: from DM4PR12MB5168.namprd12.prod.outlook.com (2603:10b6:5:397::8) by
 BN6PR12MB1363.namprd12.prod.outlook.com (2603:10b6:404:1f::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5102.16; Tue, 29 Mar 2022 20:36:48 +0000
Received: from DM4PR12MB5168.namprd12.prod.outlook.com
 ([fe80::b5ce:25ac:77a6:9903]) by DM4PR12MB5168.namprd12.prod.outlook.com
 ([fe80::b5ce:25ac:77a6:9903%6]) with mapi id 15.20.5102.023; Tue, 29 Mar 2022
 20:36:47 +0000
From:   "Limonciello, Mario" <Mario.Limonciello@amd.com>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
CC:     Alessandro Zummo <a.zummo@towertech.it>,
        "open list:REAL TIME CLOCK (RTC) SUBSYSTEM" 
        <linux-rtc@vger.kernel.org>, Jinke Fan <fanjinke@hygon.cn>,
        Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>,
        Raul E Rangel <rrangel@chromium.org>
Subject: RE: [PATCH] rtc: Fix the AltCentury for AMD platforms
Thread-Topic: [PATCH] rtc: Fix the AltCentury for AMD platforms
Thread-Index: AQHYBz6qIcPuo44f0UyKVh/t7CGyn6xsSFGAgAAIBgCAavpoQA==
Date:   Tue, 29 Mar 2022 20:36:46 +0000
Message-ID: <DM4PR12MB5168A637030600A2B8B712D6E21E9@DM4PR12MB5168.namprd12.prod.outlook.com>
References: <20220111225750.1699-1-mario.limonciello@amd.com>
 <dd1b3f97-316e-09ac-05de-43fb1320c5b0@amd.com> <YemwVn65H2yotmfd@piout.net>
In-Reply-To: <YemwVn65H2yotmfd@piout.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=true;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2022-03-29T20:36:10Z;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public-AIP 2.0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ActionId=5267c0e9-65a1-4b9d-8534-c700cc69279f;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=1
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_enabled: true
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_setdate: 2022-03-29T20:36:45Z
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_method: Privileged
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_name: Public-AIP 2.0
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_actionid: 3d0a2f64-b423-4112-afa4-447c53659f60
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_contentbits: 0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 931ca99c-bb5d-4ea6-448b-08da11c3d84a
x-ms-traffictypediagnostic: BN6PR12MB1363:EE_
x-microsoft-antispam-prvs: <BN6PR12MB1363A73EC0F0F39DC1B73579E21E9@BN6PR12MB1363.namprd12.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LfUpSYhrLj+XknIsJEJ2ki3/4iOGtiUlpCs0JTSAZdlSKBYR42vMyfZPlkFFzbZdnjI7fbluKe5QRz4a9D+/EKW5/+5cHJKvW0qQpNfctqCCpbFrRHfMo2livo6xZhToMhyDGL+CePSNdQRW0azvoYA0hACo4TQRSYvl/D6TswI14iQVjcEgrIHRJDni6/2wEgwZYf9jjrMvEaywS4l9UbkofECO1JgDfG7TTNTewb19I4CRruSqCW7sw/Ymh82pfVbA9V81knMS/sET0Y5+HwQQBeDcFdofIVAsv7pMOCKDqbvouyM9Xyahj1Gwt7u3dhYQebF2m+GT7X10Lsx/8QJl+iY5CyMHMLtx3BGRm6a32+ymeOR1adLVXsE03WSrOEBp2FMT24Je/u3yaebdE3XPRRPrTFx20X/BrPBQW/KLctLECJ2PDVHU4lTrx48QRARu7LxdO2cn48/A2iR+7l5a8uGXvpTr/e0zTZxPgWTJUkaCHDJEjj4ZN5UwKtX+MwOT2DXI8fLCshFkAb31YCr/k3WvB8wHs78BbhY1FwDC711dGk+11LuBHBMs3htTzp2zKxw9PjJ0zGuFPNuzx6jt4rR5G/BUoXzrYihot0VASn122Yy91X2ri3cxzd+FCTYgTycuO1P5V46TjJHkiUqMgi2MeL3zfHSP1IjWbp8j3giBIoIjmqSdClfO4E4o8MGiLLnTeZ9uBF925GzPaO1xFnCB0RJzMPVatLcgFKw1Q74TTU9VREDfnACIikqwCeqNv9Je+RSSUg5PmhtEGalap9aqNa2Q6cNmCydYzrnnx4IODaCdjzdKkkNlXzyICZdIJ73Z3fPI9/snVANT4Q==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5168.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6506007)(508600001)(66476007)(53546011)(7696005)(66446008)(316002)(52536014)(4326008)(8936002)(66946007)(5660300002)(64756008)(9686003)(86362001)(966005)(38070700005)(45080400002)(55016003)(76116006)(71200400001)(8676002)(122000001)(6916009)(66556008)(54906003)(83380400001)(33656002)(38100700002)(2906002)(186003)(26005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?CglZ6GRqhPW4Hz3tnAlvXBQfSZDGgzwhuxGWc7Cw6r3Fxzv8Qdz6pOsi/tXk?=
 =?us-ascii?Q?oaeo7IRCpusBIyZzhEJu8bRcYlXUfexTDpF/5M0DJgJOPTtfadkGR5660LMw?=
 =?us-ascii?Q?2fdOhJPWkZeQP2U01RNtT22DKhZ2nm9cT7SJfZjO7uXQidol+eLlVgrLNJeB?=
 =?us-ascii?Q?6nx0+wmX9Q+wBuM9tFV7noqfBPvlBQF4U8Huu5rupwWzbtTxlT4PNhOwoaJC?=
 =?us-ascii?Q?Qs9rqR01yoqOpZIL/bAvHVx14bzulG8VoL6yuiDJdiNdRfQlHjYcvRkldY4r?=
 =?us-ascii?Q?N3T5qhLXdU1cCFREqyz9BBvYRpeI7oj3S+k1EAlSbNeLME+VwxOD+pJaPfD/?=
 =?us-ascii?Q?SmrAQWHXzajFbes47bMhenUhMoFuSAKKQt3n3NX0hUBYd9ajZyhq5mUTJVrw?=
 =?us-ascii?Q?R/OtosHcFep4wZXORS/sRewGbAY3s9RoBDMWLNaAlKArdCV74e71u0WXqqv2?=
 =?us-ascii?Q?zL6mGfSZpb35c5Ns5VBLghlzo/GteLAiNQgSLbSvQOgLI4En4hsrZT7J6S1G?=
 =?us-ascii?Q?FFeRAjkRvx6n/vJHx6h/SunIIqubzacSHJRUqJGkvcIxjKf78gwLGXbI9r9g?=
 =?us-ascii?Q?gBuBeWi3tgmVnKgX4DSmjUM+4oKVcd/aN5Nso9abicwB6XDgmsjOzDkA6AWf?=
 =?us-ascii?Q?akdL4+UuEP7NTS9vdD1yP/+B9NTG+ImfYWtClPJKaFk38rWVYgfEZgwgxAzx?=
 =?us-ascii?Q?dHa0JDM5iDMyzMVzvr3UH+vW677ExdrPaqFzfd88WlpxWkD6GYByB6klHIS1?=
 =?us-ascii?Q?O5V42SWF/mQ0RR75wajuzwxMH24euiGXTw8mBpGPv6XLnltlRtO/4bxeuo+z?=
 =?us-ascii?Q?j6Tg/s6h5zXqA4CRPyE/mJglf7P4YqmdlLKqtE6e+X/QYSO8KM7utdWF0ce7?=
 =?us-ascii?Q?M29llsw+QlPIs2qLlkHyGVBC7V3M6xDbiCNFvG6COb5OKNxaHi7qWPqegx76?=
 =?us-ascii?Q?xwnQcWtdsbyUeGxc99bk/kKA3jpPjgG7yXl5Zo2lsuB9cj21ZdGLUwo8oWly?=
 =?us-ascii?Q?KK3hgkHZGO6hOGTFSPUSztFCUWvTg+Upk3yMFjiIYKrDedvfyiUUFB/MZr6h?=
 =?us-ascii?Q?Qp4ji/lZbJfZ49klWIFwnT+imCSfCtrJ0kex0XosZnYhCcTh9vMtrBKNbLxZ?=
 =?us-ascii?Q?8IirvTcfYgFs7o8g+pbbxwVtw8Rz0qP/Eibg4I8kuuR1cqpRa6TkAxvcX5AF?=
 =?us-ascii?Q?R0A4gHPF001lhCk5+BjvGtolVfW3qsFOSJQYXAp/RoVwJkwkTty1T4XkQMNV?=
 =?us-ascii?Q?DjtW1NW9Q/UvZ7K7A1gUMy6w3OHmxCZpd7um11b8V2CPGe8l+UDzRxK1tg9W?=
 =?us-ascii?Q?+PHuck8NB/vaCuGmj+XTTCEVPDtymYxuWsLJKi+hFZ5lCD9xFi2CEft5Z4k7?=
 =?us-ascii?Q?JW2GT6cYvwsiR1Al5Ic3+QC946myQHuAMNHpPX8QfHpjU7+M4s2r88t7CPwK?=
 =?us-ascii?Q?fDzR4ZV5eJatXrp8hqsMXgtbFdX5AHNo1eVVHiMQEnMsvU7NEJp0N7sb8NUv?=
 =?us-ascii?Q?eWGKqBIk2lCRZwgF15G/xqV5uIHCYSxmo6aBfV908BmSgqqf3y29V9fHyYo+?=
 =?us-ascii?Q?6E8ikgGAPY/mv92A8zCRtbsuPmRcAnByFolQLteA6Agmc/ZSiWcxwPB6oDLU?=
 =?us-ascii?Q?9cqVKJXVvE/d9aOWT0wNdQLfNgwi1kuuKcm5s4N55x1y9bxDP1mZTveFxnmX?=
 =?us-ascii?Q?Iih37vxM/wO2f7a2C2k48vKU54FETg8nXTFF/oXlpicxAwYZMDffrS4MNPEO?=
 =?us-ascii?Q?PYO+04zPkA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5168.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 931ca99c-bb5d-4ea6-448b-08da11c3d84a
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Mar 2022 20:36:47.0137
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6xTfwxxE/v2xMXyeyLzCBOnaiaJnPBMJWNdaLi6OdjiVBpPsc6m2Ei9KvjOsSUiRE70ImatZ22wYxCdnyHwGzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1363
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

[Public]



> -----Original Message-----
> From: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Sent: Thursday, January 20, 2022 12:56
> To: Limonciello, Mario <Mario.Limonciello@amd.com>
> Cc: Alessandro Zummo <a.zummo@towertech.it>; open list:REAL TIME
> CLOCK (RTC) SUBSYSTEM <linux-rtc@vger.kernel.org>; Jinke Fan
> <fanjinke@hygon.cn>; Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>;
> Raul E Rangel <rrangel@chromium.org>
> Subject: Re: [PATCH] rtc: Fix the AltCentury for AMD platforms
>=20
> On 20/01/2022 12:27:39-0600, Limonciello, Mario wrote:
> > On 1/11/2022 16:57, Mario Limonciello wrote:
> > > Setting the century forward has been failing on AMD platforms.
> > > There was a previous attempt at fixing this for family 0x17 as part o=
f
> > > commit 7ad295d5196a ("rtc: Fix the AltCentury value on AMD/Hygon
> > > platform") but this was later reverted due to some problems reported
> > > that appeared to stem from an FW bug on a family 0x17 desktop system.
> > >
> > > The same comments mentioned in the previous commit continue to
> apply
> > > to the newer platforms as well.
> > >
> > > ```
> > > MC146818 driver use function mc146818_set_time() to set register
> > > RTC_FREQ_SELECT(RTC_REG_A)'s bit4-bit6 field which means divider
> stage
> > > reset value on Intel platform to 0x7.
> > >
> > > While AMD/Hygon RTC_REG_A(0Ah)'s bit4 is defined as DV0 [Reference]:
> > > DV0 =3D 0 selects Bank 0, DV0 =3D 1 selects Bank 1. Bit5-bit6 is defi=
ned
> > > as reserved.
> > >
> > > DV0 is set to 1, it will select Bank 1, which will disable AltCentury
> > > register(0x32) access. As UEFI pass acpi_gbl_FADT.century 0x32
> > > (AltCentury), the CMOS write will be failed on code:
> > > CMOS_WRITE(century, acpi_gbl_FADT.century).
> > >
> > > Correct RTC_REG_A bank select bit(DV0) to 0 on AMD/Hygon CPUs, it wil=
l
> > > enable AltCentury(0x32) register writing and finally setup century as
> > > expected.
> > > ```
> > >
> > > However in closer examination the change previously submitted was als=
o
> > > modifying bits 5 & 6 which are declared reserved in the AMD
> documentation.
> > > So instead modify just the DV0 bank selection bit.
> > >
> > > Being cognizant that there was a failure reported before, split the c=
ode
> > > change out to a static function that can also be used for exclusions =
if
> > > any regressions such as Mikhail's pop up again.
> > >
> > > Cc: Jinke Fan <fanjinke@hygon.cn>
> > > Cc: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
> > > Link:
> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flore.
> kernel.org%2Fall%2FCABXGCsMLob0DC25JS8wwAYydnDoHBSoMh2_YLPfqm
> 3TTvDE-
> Zw%40mail.gmail.com%2F&amp;data=3D04%7C01%7Cmario.limonciello%40am
> d.com%7C3357df64bb864b6ef63e08d9dc468eae%7C3dd8961fe4884e608e11a
> 82d994e183d%7C0%7C0%7C637783018746468575%7CUnknown%7CTWFpbGZ
> sb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6M
> n0%3D%7C3000&amp;sdata=3DCzgBBpAXk2F6Aj1xuYtnUgN12%2BN%2F8CdJa3
> nexix3eQY%3D&amp;reserved=3D0
> > > Link:
> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fww
> w.amd.com%2Fsystem%2Ffiles%2FTechDocs%2F51192_Bolton_FCH_RRG.pd
> f&amp;data=3D04%7C01%7Cmario.limonciello%40amd.com%7C3357df64bb864
> b6ef63e08d9dc468eae%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%
> 7C637783018746468575%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAw
> MDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sda
> ta=3Dl54ilxU2BSuV7L%2ByptnzFFOYqm1gN4M85rzdhmgEJro%3D&amp;reserve
> d=3D0
> > > Signed-off-by: Raul E Rangel <rrangel@chromium.org>
> > > Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> > > ---
> > >   drivers/rtc/rtc-mc146818-lib.c | 16 +++++++++++++++-
> > >   include/linux/mc146818rtc.h    |  2 ++
> > >   2 files changed, 17 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/rtc/rtc-mc146818-lib.c b/drivers/rtc/rtc-mc14681=
8-lib.c
> > > index dcfaf09946ee..3c8be2136703 100644
> > > --- a/drivers/rtc/rtc-mc146818-lib.c
> > > +++ b/drivers/rtc/rtc-mc146818-lib.c
> > > @@ -120,6 +120,17 @@ unsigned int mc146818_get_time(struct rtc_time
> *time)
> > >   }
> > >   EXPORT_SYMBOL_GPL(mc146818_get_time);
> > > +/* AMD systems don't allow access to AltCentury with DV1 */
> > > +static bool apply_amd_register_a_behavior(void)
> > > +{
> > > +#ifdef CONFIG_X86
> > > +	if (boot_cpu_data.x86_vendor =3D=3D X86_VENDOR_AMD ||
> > > +	    boot_cpu_data.x86_vendor =3D=3D X86_VENDOR_HYGON)
> > > +		return true;
> > > +#endif
> > > +	return false;
> > > +}
> > > +
> > >   /* Set the current date and time in the real time clock. */
> > >   int mc146818_set_time(struct rtc_time *time)
> > >   {
> > > @@ -191,7 +202,10 @@ int mc146818_set_time(struct rtc_time *time)
> > >   	save_control =3D CMOS_READ(RTC_CONTROL);
> > >   	CMOS_WRITE((save_control|RTC_SET), RTC_CONTROL);
> > >   	save_freq_select =3D CMOS_READ(RTC_FREQ_SELECT);
> > > -	CMOS_WRITE((save_freq_select|RTC_DIV_RESET2),
> RTC_FREQ_SELECT);
> > > +	if (apply_amd_register_a_behavior())
> > > +		CMOS_WRITE((save_freq_select &
> ~RTC_AMD_BANK_SELECT), RTC_FREQ_SELECT);
> > > +	else
> > > +		CMOS_WRITE((save_freq_select|RTC_DIV_RESET2),
> RTC_FREQ_SELECT);
> > >   #ifdef CONFIG_MACH_DECSTATION
> > >   	CMOS_WRITE(real_yrs, RTC_DEC_YEAR);
> > > diff --git a/include/linux/mc146818rtc.h b/include/linux/mc146818rtc.=
h
> > > index 0661af17a758..1e0205811394 100644
> > > --- a/include/linux/mc146818rtc.h
> > > +++ b/include/linux/mc146818rtc.h
> > > @@ -86,6 +86,8 @@ struct cmos_rtc_board_info {
> > >      /* 2 values for divider stage reset, others for "testing purpose=
s only"
> */
> > >   #  define RTC_DIV_RESET1	0x60
> > >   #  define RTC_DIV_RESET2	0x70
> > > +   /* In AMD BKDG bit 5 and 6 are reserved, bit 4 is for select dv0 =
bank */
> > > +#  define RTC_AMD_BANK_SELECT	0x10
> > >     /* Periodic intr. / Square wave rate select. 0=3Dnone, 1=3D32.8kH=
z,...
> 15=3D2Hz */
> > >   # define RTC_RATE_SELECT 	0x0F
> >
> > Hi Alexandre, Alessandro,
> >
> > Friendly ping on this request.
> >
>=20
> This was sent too close from the merge window to be applied.

HI Alexandre,

I checked and didn't see this come into master as most of the 5.18 trees ca=
me in.
Did this get forgotten?

Thanks,

>=20
> > Also if it wasn't made clear in my commit message or by analyzing this =
code
> > change, I do believe that at least part of the reason for the previous
> > regression was because of mucking with reserved bits.  This patch is mu=
ch
> > more conservative.
> >
> > In my testing I found similar behaviors from the old regression on a mo=
re
> > modern platform when those bits were being touched.
> >
> > Mikhail,
> >
> > As you flagged the previous regression, would appreciate if you're able=
 to
> > test the new patch (although of course many things in your situation ha=
ve
> > changed now).
> >
> > Thanks.
> >
>=20
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fboot
> lin.com%2F&amp;data=3D04%7C01%7Cmario.limonciello%40amd.com%7C3357
> df64bb864b6ef63e08d9dc468eae%7C3dd8961fe4884e608e11a82d994e183d%
> 7C0%7C0%7C637783018746468575%7CUnknown%7CTWFpbGZsb3d8eyJWIjoi
> MC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C300
> 0&amp;sdata=3Dgvm24hJhVEsXrRQT6c1GtkMhi3q77Df1Biowb6gVdS8%3D&am
> p;reserved=3D0
