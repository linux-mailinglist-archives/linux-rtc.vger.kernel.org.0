Return-Path: <linux-rtc+bounces-6621-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8djMIYzXHmpWVwAAu9opvQ
	(envelope-from <linux-rtc+bounces-6621-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Tue, 02 Jun 2026 15:15:56 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EB86062E63F
	for <lists+linux-rtc@lfdr.de>; Tue, 02 Jun 2026 15:15:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=microchip.com header.s=selector1 header.b="AxQJ/7dN";
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6621-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6621-lists+linux-rtc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=microchip.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D50EB302A4D9
	for <lists+linux-rtc@lfdr.de>; Tue,  2 Jun 2026 13:14:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2FE13E008F;
	Tue,  2 Jun 2026 13:14:06 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010037.outbound.protection.outlook.com [52.101.85.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90E7C3D1A86;
	Tue,  2 Jun 2026 13:14:05 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780406046; cv=fail; b=pOSakLba3cLFNFybdMX/0tdguvI75AVoLW5A4ij06a+CFDM1vaQeV5Zqh34eVlC/SnCD3xLfOoC4sRqPvfFOp8qRB7rv3BRXmiRQF8uZgHa/NuihyU1FaHx8pPRDCaCM84HB/Wf7YSY0bB5klxXrz2vzaG0hBm8IQeSgrfhndM0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780406046; c=relaxed/simple;
	bh=6EA76C5KYieIJ6SkXAZzpiVgOKIM5nr79cwPlHjpGcM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=I6ZHcooMd81gEyM/RnoZl+NtW5nsKOTd8UG8A9Vnk5zQZea8i06In8Ga+ugxuKQcUFtatQ9JfbEqx9Ohe/SE8qu6peeQ3zjAhZhrzM7xfnC/ri60TsnaTON8kT8tRPMEJfS/P3aenU76BaUilxxWRShXHB5OiU8Q6XdFDLD5hck=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=AxQJ/7dN; arc=fail smtp.client-ip=52.101.85.37
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XXOVbDt4rZTdH7Et9xN8RAoP1HAXIa43LVIJZGns0YCfGR46EZh5V8p1d/+539uAubqhBh58Gj8PsJ3KM3hYtHfg+IgIwmLowcX4Ygl276/v95VWwJGGgmYm/VScUgWmRN3LGw64y66B1Ak114JWqYIiNBOA8K/EYgvUWkcSmoBeCAYiM5bNyy9Byy1eovFBYE+jCXeEnKTwI5qp5pgcjXqnkuelKMK1ZnEwN/VHTVgN0O5P2BjwiTDLSXvLL8G8zaU5jWBK1VCqBaiUaj5807QP/O4vDN9h/ZiucbWByanho6CKJtndVZoaUQqj2ZK6rd9phfwqSsh42afd9yTCJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6EA76C5KYieIJ6SkXAZzpiVgOKIM5nr79cwPlHjpGcM=;
 b=dqpEXXZoUXELt+EXDovoTNyTduJrwOZ+y4VufV+n9BvsLaCoH7vbFwgsgmr04FdwKJGs4H6y17agXLBQqwLt03xLc6BwMl3sMmokjafMZawxEEW/BklUhDcFEhqm41RP2twvA37AePMHOOZiiNLyKUjsaf3X78Mdf8PG8/sIo3FuwD0tt8lPJzMUnYU2pPVe2rtCMnCGJYrkiQwXV7fuaqHm3hOMbNjgNBUEMS2vUMke3mV12/Ff4FEs/4IUv+xO2GrD0uFavMZQIi2/9V0jehJ5lJxY6BTzcNGojX2SSxKtOG/k7trrurGHvkM0/tp4mDyls3eEq35WlGDBJtBytQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6EA76C5KYieIJ6SkXAZzpiVgOKIM5nr79cwPlHjpGcM=;
 b=AxQJ/7dNCdM+ocSucK637ypSPgCGqNAQLs5Kh8YJ2GNLEJHIS2lS+Sjg7FL18ZLypyHAPgO9xbUqC36qYNjvNiPbtXG5avF6eiUDcq9dYsiED64ZucoU5xeNUCEHYuoNA7uU9y1jfOgjgnu0J9Ovp1yWGWW3AEKKd7TJkfAcMbC9BDazIPd6QJl5VR+8j0OQPMG68jBkDU6zk9hrU0W8okE0ekpnvsxhgkIxGm7+MaHWYDsQdkIyU3TGKBwuX9/LXw0OKkS0gZ9cM2N4luwc8WGvz0J4vRR1RqthYa88lLkkvgRbgxE3xTFo968deOeFHw+oNNgdeHAS42RncC4KNA==
Received: from DS0PR11MB8739.namprd11.prod.outlook.com (2603:10b6:8:1bb::19)
 by PHXPR11MB9664.namprd11.prod.outlook.com (2603:10b6:510:3cb::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.17; Tue, 2 Jun 2026
 13:14:02 +0000
Received: from DS0PR11MB8739.namprd11.prod.outlook.com
 ([fe80::16c9:73db:2df7:cb9d]) by DS0PR11MB8739.namprd11.prod.outlook.com
 ([fe80::16c9:73db:2df7:cb9d%6]) with mapi id 15.21.0092.006; Tue, 2 Jun 2026
 13:14:02 +0000
From: <Valentina.FernandezAlanis@microchip.com>
To: <conor@kernel.org>, <linux-riscv@lists.infradead.org>
CC: <Conor.Dooley@microchip.com>, <stable@vger.kernel.org>,
	<Daire.McNamara@microchip.com>, <alexandre.belloni@bootlin.com>,
	<linux-rtc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<Valentina.FernandezAlanis@microchip.com>
Subject: Re: [PATCH v1] rtc: mpfs: fix counter upload completion condition
Thread-Topic: [PATCH v1] rtc: mpfs: fix counter upload completion condition
Thread-Index: AQHc4wHZsdW2vX0SwUuStMWJgxUlwLYrYgAA
Date: Tue, 2 Jun 2026 13:14:02 +0000
Message-ID: <fa8c35eb-7572-4413-867d-db42df92790f@microchip.com>
References: <20260513-panhandle-ashy-70c6abf84d59@spud>
In-Reply-To: <20260513-panhandle-ashy-70c6abf84d59@spud>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla Thunderbird
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB8739:EE_|PHXPR11MB9664:EE_
x-ms-office365-filtering-correlation-id: 020bf556-a0ac-4039-c79d-08dec0a8d0f4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700021|22082099003|18002099003|56012099006|11063799006;
x-microsoft-antispam-message-info:
 P3bCjDGuBIcujfyE41Oz4pQDW4Q2pz4m4AdKUG6NLJ+gujAfvCGwlExEeMezZPuw/vfhxZwHYqlOYhCeNDbqdn2uezHYU1rm3xO61goWZSHwLoYBR91x+jIUoDrJKobLihBwG2ZAtV9j/jIUH9xMjOeuge54upsAY7pt0SI6lWYYb67MM7gM+KEynYT4rTMA62vOekQLQPcsoA3hXqseGAL7uetlE1zeP7X5KUrg3mtajSe7vAQDDflv8I/8C7jZWMdvjjVQputLFkAw0oEA+JvNyAPu+OmwyDEbxWpoJypJp7LF8M4EObBKUdycm+XuBzJLXPdpPFRoOy4h+Rrk6vG7t3FNON3IjdbArqHoLb8u9fnD1502dOwVxAMpLlgRvskP3evCAVZt8gcdsV9W+O8CiDCcyhLHS4KmAkigYKIlx5+Pjig4KvFI91lHH8O40NlkCYf9e2VPqX94T+JDWy3Oxcco4V0yr8u89rjDAzczhUct+IgCj4fZMEFmLaZvr5GALXaEEwiXmMO1ovGBNNGGTEG0PDDzYxY/Db1+qw2YWFU4WQB7eszMibHOYJFsP4YbKCk16vwGiLR1Yiu2+ai7x6WRa25joKuRAO7fb8MiF1YzRGthe6/rG0P37rtjJRXNbonrYoyjICUKr5LeVmPG0EIoTZb5V+J+8Z2iFfQny3ZOvgRq21URCG5IIdTWRXFEIWnjpN9w49SNtR8UPAvOc0CmeADS42tzXFLCbVPHk5UfPLRN1wr4WQbT7FjU
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB8739.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021)(22082099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NDlmOURoQnB0WDdNUnJUNThrNTV2V3hkSU04bWQwMG56dEx0NlRqMUpLMWUw?=
 =?utf-8?B?bTBkZkN3NDdBNnlHV2pXSHRZc2lmYTNQVkRLSzRzeDFGN3pyWXhCdDV3RGJB?=
 =?utf-8?B?UGs4bERxeDhSZUdHVmVpZ2YrQU1FTGJjZXZVaExGV0pvcjM1bFJNQitqaUpY?=
 =?utf-8?B?eXIrNzRjb1RlVit5WFd5WFJCeUtsNWhZY1RNLzhDS1llbXR3ekR5c25rY0NN?=
 =?utf-8?B?UzNqeCtlNTBha0FCZUhGN1c0Y2NFUllqSGppbTAybCtvcDVRODNpVmkybFI3?=
 =?utf-8?B?YWZyOGs0MXZZem1UM3k3MnNybW0xaWIyNzZBSENFdEJXSld0RmtSd0Fsc3No?=
 =?utf-8?B?dmpiQmtWZFczbWFJR3dTcnF2UDNTQjJuZ01pczg5QUVXaEVSTHhqUWVPeUFw?=
 =?utf-8?B?U3VtVUtXR3Jqek5tbEdXUEJKdlJobmUwWEdRSmpSbWpVa0Q3akppbXdVbFg4?=
 =?utf-8?B?ck9zekVYMnlidmpkNy9Ed2crbE9KTjJvRjY2VEJvWWorU0dlMEhvanpnV05H?=
 =?utf-8?B?dHM2L3dlWFRGVGo5bWRPOS9MODlJOVo4UVRZakMrVmlpeThQRm9Dc2Z2elpu?=
 =?utf-8?B?c0Z3NFIwRkRNSTNSSmRiYTY1RmlOMmFtRWY5Um1mRjlZQVl6cXFoZkk0eXFW?=
 =?utf-8?B?TGRWSkdxbmduS2ZuQXhzYm54cjNLdUtqOERZSnZ4MEVvTGtaMlFxT3VQc2JE?=
 =?utf-8?B?V0RvTEV5bExRSXlkbk0rUDZxQjBuWFMwb2pvRmEzb2tFTHk0ZUdZdk13bnFK?=
 =?utf-8?B?bU53YWJBOUZBVU9FNlpCdlphazhXc3EwbE1oODFQWS9vT3lnMXN2MkJVaFps?=
 =?utf-8?B?ZFlONmhwdDdXWHI3cVpjc1YxS3JYRGhCK3pTNVd0ZTBjQlJvQm9aRkJUQnk5?=
 =?utf-8?B?bk9GQU8xYXlQTnorcTB4ZFRORHpxTlZnRE0yOFBlZHg4RmdDMlRqZFJZMHV4?=
 =?utf-8?B?MTNuTWc4UlVDc2dZbk9kdXk1K2JIZlg0cVQrMXFmWUlkbncyRzBFYmF0a21T?=
 =?utf-8?B?SGtlWi8ycVMwSlArZnUvQVpST25kODNXS29RV1pXa0VxQ1Y2SnF2WFlDUThj?=
 =?utf-8?B?eEJ5VDQ2eUZBc2N5bGxYL3FsTVFSUHV0cndCcDQvZC9pbTFjSFB4dHRFWmxo?=
 =?utf-8?B?ZitTWHhoUEpubSsyaUJtT21QdEhoekk2RFBFdHV5bWdwY29MOCtZVG5IaGRV?=
 =?utf-8?B?S3JVNEEvM0pkV3FMVllCOUlpQXBkQS9Hb01BUjR6ZmNaeFBBdEpZbGVLejQx?=
 =?utf-8?B?S0wzS0dURjgxMmk0dHVqRkNtNU1JQ1ZBdlpYaUVFN2JnZTBFSzVUbCtsQkV1?=
 =?utf-8?B?MGZXOEZhR3phRjhPOElzMkVWaGEvQmRBZGo0cEdCOVlub1lpRTgzTy8weXVU?=
 =?utf-8?B?N2hEdDZWSEVPNlFrV1FiUElpaTBHS3JJQWZsbEs0ekFRelY4RE9IN0JkdXp5?=
 =?utf-8?B?NmkrVmJUQ0xjSkxxUWd0YmIyODhVaU1QWXRyQ1NNTk15TW9QaXJHUkh2MG5B?=
 =?utf-8?B?V0t5MEtuQUdpTDVBaG80OXZSK3huWHdRNnZvaG5mTXpKdExnRUJ0aGdZT25I?=
 =?utf-8?B?VXA3UU1ZZ1R0R0M2S3p6Um5nYzZJVDN6U2xDUzhEZUhwUWNyZ3dtQUhqMUJn?=
 =?utf-8?B?amVGMHhXS29tZFVpTWkrdmU3TWV6MnAxTUdSZXdlYjk4bEhBbW9JVFFSRG1r?=
 =?utf-8?B?TWRqQ1Y4TWQ2ZThqM21LSXJXcm5XemdCME1ibGw1WjdUTXFnY2Z3Q3NnRVRh?=
 =?utf-8?B?UEdzaStIRDZLOTFKRjExR0xTRERKbCtpdHB0WStoUFJZR0VMNS90ZXQ2clZP?=
 =?utf-8?B?d2EyVlZDRDgxQVZYWDBQVzNuRVpPWE9wdHJ3Lzd1Mk1IcXZadnIvTzAvNGdi?=
 =?utf-8?B?ejI5SkF6dmFNanl5Nk5jZ1h0MTZKSFFKUnh4cGQzZmc0eVpPZUtIUFAyK2FL?=
 =?utf-8?B?a2x3MnMrVG9PQnhzRnVoTFB1NWRvZFhVRWxRV1g0OFFubVgwbVRwR213QjdF?=
 =?utf-8?B?MzA1d3MyNEk4UWJNWGVhS0tkSFdvWWVCdE52Y0NoU1M4RjBIUjlzZkVoc244?=
 =?utf-8?B?SDlEc2pTanZYTmV5cGlHSnZPZnFhcGFCQ2VXL1B1ZytQek9VZm1KTUExUnRy?=
 =?utf-8?B?RHR2R01CUFdqRGVzVFdpMUQ5ZGZxdlBWMkFENTk5cUp6NkZtMHcvY2NobzZl?=
 =?utf-8?B?WU04QWVxcHBGa2J4MCtaWE1uYkRsRlg2Q1p6cXlidSs2RGhVcCt3SzJDVWdh?=
 =?utf-8?B?QjRYeDd4UmowOXNYMDFZdkt2SEVneHgzbnB2eXZhZEFJTzNKRVhqT0ZvMWw5?=
 =?utf-8?B?Y1JxOWlXRDFKMGxVd2pYaHNwSzhtem94M3Q1cE5uZWo4bjArSEFmKzBudGJt?=
 =?utf-8?Q?OlN72akSqFxg63V3wiDfFyaf3CYvbAQnBa11Q?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9601449ABA6B554F8EED6A916DA7B3EC@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: microchip.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8739.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 020bf556-a0ac-4039-c79d-08dec0a8d0f4
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jun 2026 13:14:02.5334
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8zcbx74NI80djYa6F7n3pknoeKKW9VtIsm2NDw6HVetjZJKRnaMBDmP3AxtoZPMr2gVWVENegMblTjHxJEp/zGIfflGwGXVCfOgCslRyEnksxh47uRGixFYxLnCYW2sA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PHXPR11MB9664
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.94 / 15.00];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[microchip.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[microchip.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6621-lists,linux-rtc=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[Valentina.FernandezAlanis@microchip.com,linux-rtc@vger.kernel.org];
	FORGED_SENDER(0.00)[Valentina.FernandezAlanis@microchip.com,linux-rtc@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:conor@kernel.org,m:linux-riscv@lists.infradead.org,m:Conor.Dooley@microchip.com,m:stable@vger.kernel.org,m:Daire.McNamara@microchip.com,m:alexandre.belloni@bootlin.com,m:linux-rtc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:Valentina.FernandezAlanis@microchip.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[microchip.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_NO_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-rtc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,microchip.com:mid,microchip.com:dkim,microchip.com:from_mime,microchip.com:email,infradead.org:email,bootlin.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EB86062E63F

T24gMTMvMDUvMjAyNiAxODo1NSwgQ29ub3IgRG9vbGV5IHdyb3RlOg0KPiBGcm9tOiBDb25vciBE
b29sZXkgPGNvbm9yLmRvb2xleUBtaWNyb2NoaXAuY29tPg0KPg0KPiBUaGUgY29uZGl0aW9uIHRo
YXQgbmVlZHMgdG8gYmUgY2hlY2tlZCBmb3IgdXBsb2FkIGNvbXBsZXRpb24gaXMgdGhlDQo+IFVQ
TE9BRCBiaXQgaW4gdGhlIGNvbXBsZXRpb24gcmVnaXN0ZXIgZ29pbmcgbG93LiBUaGUgb3JpZ2lu
YWwgaXRlcmF0aW9ucw0KPiBvZiB0aGlzIGRyaXZlciB1c2VkIGEgZG8td2hpbGUgYW5kIHRoaXMg
d2FzIGNvbnZlcnRlZCB0byBhDQo+IHJlYWRfcG9sbF90aW1lb3V0KCkgZHVyaW5nIHVwc3RyZWFt
aW5nIHdpdGhvdXQgdGhlIGNvbmRpdGlvbiBiZWluZw0KPiBpbnZlcnRlZCBhcyBpdCBzaG91bGQg
aGF2ZSBiZWVuLg0KPg0KPiBJIHN1c3BlY3QgdGhhdCB0aGlzIHdlbnQgdW5ub3RpY2VkIHVudGls
IG5vdyBiZWNhdXNlIGEpIHRoZSBmaXJzdCByZWFkDQo+IHdhcyBkb25lIHdoZW4gdGhlIGJpdCB3
YXMgc3RpbGwgc2V0LCBpbW1lZGlhdGVseSBjb21wbGV0aW5nIHRoZQ0KPiByZWFkX3BvbGxfdGlt
ZW91dCgpIGFuZCBiKSBiZWNhdXNlIHRoZSBSVEMgZG9lc24ndCBob2xkIHRpbWUgd2hlbiBwb3dl
cg0KPiBpcyByZW1vdmVkIGZyb20gdGhlIFNvQyByZWR1Y2luZyBpdHMgdXRpbGl0eSAoSSBmb3Ig
b25lIGtlZXAgaXQNCj4gZGlzYWJsZWQpLiBJZiBteSBmaXJzdCBzdXNwaWNpb24gd2FzIHRydWUg
d2hlbiB0aGUgZHJpdmVyIHdhcw0KPiB1cHN0cmVhbWVkLCBpdCdzIG5vdCB0cnVlIGFueSBsb25n
ZXIgdGhvdWdoLCBoZW5jZSB0aGUgZGV0ZWN0aW9uIG9mIHRoZQ0KPiBwcm9ibGVtLg0KPg0KPiBG
aXhlczogMGIzMWQ3MDM1OThkYyAoInJ0YzogQWRkIGRyaXZlciBmb3IgTWljcm9jaGlwIFBvbGFy
RmlyZSBTb0MiKQ0KPiBDQzogc3RhYmxlQHZnZXIua2VybmVsLm9yZw0KPiBTaWduZWQtb2ZmLWJ5
OiBDb25vciBEb29sZXkgPGNvbm9yLmRvb2xleUBtaWNyb2NoaXAuY29tPg0KVGVzdGVkLWJ5OiBW
YWxlbnRpbmEgRmVybmFuZGV6IDx2YWxlbnRpbmEuZmVybmFuZGV6YWxhbmlzQG1pY3JvY2hpcC5j
b20+DQo+IC0tLQ0KPiBDQzogVmFsZW50aW5hLkZlcm5hbmRlekFsYW5pc0BtaWNyb2NoaXAuY29t
DQo+IENDOiBDb25vciBEb29sZXkgPGNvbm9yLmRvb2xleUBtaWNyb2NoaXAuY29tPg0KPiBDQzog
RGFpcmUgTWNOYW1hcmEgPGRhaXJlLm1jbmFtYXJhQG1pY3JvY2hpcC5jb20+DQo+IENDOiBBbGV4
YW5kcmUgQmVsbG9uaSA8YWxleGFuZHJlLmJlbGxvbmlAYm9vdGxpbi5jb20+DQo+IENDOiBsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnDQo+IENDOiBsaW51eC1ydGNAdmdlci5rZXJuZWwu
b3JnDQo+IENDOiBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnDQo+IC0tLQ0KPiAgIGRyaXZl
cnMvcnRjL3J0Yy1tcGZzLmMgfCAyICstDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspLCAxIGRlbGV0aW9uKC0pDQo+DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3J0Yy9ydGMtbXBm
cy5jIGIvZHJpdmVycy9ydGMvcnRjLW1wZnMuYw0KPiBpbmRleCA2YWEzZWFlNTc1ZDJhLi5lY2U2
ZGU0YTZhZGJkIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL3J0Yy9ydGMtbXBmcy5jDQo+ICsrKyBi
L2RyaXZlcnMvcnRjL3J0Yy1tcGZzLmMNCj4gQEAgLTExMiw3ICsxMTIsNyBAQCBzdGF0aWMgaW50
IG1wZnNfcnRjX3NldHRpbWUoc3RydWN0IGRldmljZSAqZGV2LCBzdHJ1Y3QgcnRjX3RpbWUgKnRt
KQ0KPiAgIAljdHJsIHw9IENPTlRST0xfVVBMT0FEX0JJVDsNCj4gICAJd3JpdGVsKGN0cmwsIHJ0
Y2Rldi0+YmFzZSArIENPTlRST0xfUkVHKTsNCj4gICANCj4gLQlyZXQgPSByZWFkX3BvbGxfdGlt
ZW91dChyZWFkbCwgcHJvZywgcHJvZyAmIENPTlRST0xfVVBMT0FEX0JJVCwgMCwgVVBMT0FEX1RJ
TUVPVVRfVVMsDQo+ICsJcmV0ID0gcmVhZF9wb2xsX3RpbWVvdXQocmVhZGwsIHByb2csICEocHJv
ZyAmIENPTlRST0xfVVBMT0FEX0JJVCksIDAsIFVQTE9BRF9USU1FT1VUX1VTLA0KPiAgIAkJCQlm
YWxzZSwgcnRjZGV2LT5iYXNlICsgQ09OVFJPTF9SRUcpOw0KPiAgIAlpZiAocmV0KSB7DQo+ICAg
CQlkZXZfZXJyKGRldiwgInRpbWVkIG91dCB1cGxvYWRpbmcgdGltZSB0byBydGMiKTsNCg0KDQo=

