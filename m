Return-Path: <linux-rtc+bounces-3260-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 86D15A43BAB
	for <lists+linux-rtc@lfdr.de>; Tue, 25 Feb 2025 11:31:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E01AC178820
	for <lists+linux-rtc@lfdr.de>; Tue, 25 Feb 2025 10:26:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 848881EA91;
	Tue, 25 Feb 2025 10:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="ou/Whn+J"
X-Original-To: linux-rtc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011006.outbound.protection.outlook.com [40.107.74.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51E45266569;
	Tue, 25 Feb 2025 10:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740479080; cv=fail; b=JgkZLGIsO49OwLozTQ4RYLH1B3ibHdJXK00YpsOkPSFrfjIvVtahVFDE7QBPMUKTlWqaWsc2CQT47P8mwUEgKy1Dre54ZJWFcotJaQq7jcp+fJkKiXEx4xs/1UfBWstYWcy+pOzenLwweKsHLj6xpTFYvwAe2DXawE2Ma6nxJZg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740479080; c=relaxed/simple;
	bh=NohJZgyR5Dp/hMETZPGujHG40ahHu7DBg3MrG6MQhj4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=qtbSs3N/zfzR2BUmS9t+KoTi/k51tAS6cuLQKiwFQjFliXESjQzKI1XejtL7J5jSMyrJhwiPrY22Qho3ZmfYBviK2+QnhfjKOKm2DAtblVb/W8EFf6OMttwC990bLuVCzizTHwvN2pbXr5CAdFQaOPQgE5ByKytJ/3qJMTunlEc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=ou/Whn+J; arc=fail smtp.client-ip=40.107.74.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NLRMTO+HD2/kHCXOULrxE3oto3roRdI8eCBFWfywmKSxhIgwIi9R3BADqTkxlPYEHMaOpHdY3Qq0Bes1eQfq5cb/9K9R9vfZG6E2NtTS3Kq9xJSCpPQ1QihyEdBKqs2VXiEUftupXibgEAYi+uDH5eCxaZi8+tidvHuIyBabTuTeqJS2pXFnqOeKc6cNYM6Rt8dJOuMnNKx9NOkBhdnkKSHgr7WQamwPDyQn0nXDEi8t3gcWFIXWiXmqNlBWE9Zz3nfzpOrdE7EmShD4dAWTrhgAhBT1Al2NkC6qBAv5Gswfprgco/HICv3z6Hfk2eALpjcZdyJy/zQcJD/MmyisEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WjTVc4GNThDBcAnFsPjxcbkyLO+9YNFchhyuJnVyLf0=;
 b=Hmv1YU2XO4yfU+Gz+GHVHwNh02146YyyLudzJw3Mh/QoVqvgEX5WPD1EMDaGZ4ey6zsXAefqgzr6KsH6f2athDZnK7pRFAn44DmL8afh8Yco9nM3n3VIxK3WrBw21dZzuoxN5bS6yt3EiX400tnYMBuLrPG3FlZg4QzlCijVbw2h1l1LL/KqotEM02/BB4pgzFPCk5YEar5FT1zXHzzY6EIJ/yqv3A1QXjIjqAFM+LNoG1+YWUcwFM4zyFuGUCOr4lpL0xHolXElu3Z47HqN21XO3GH28uWuqUSqn23oDspOrqSBM65kz1qx7c4zTd6P5U8XT+4i4NVpw8vQqqEjbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WjTVc4GNThDBcAnFsPjxcbkyLO+9YNFchhyuJnVyLf0=;
 b=ou/Whn+JbO9CFXlONvhbDUSEvVgKA6WssjENI0uMbxjmutsKcnH+9mmq0VEXT/h7QTwHTwnzTcar3Nw5b2Nh56Qt1i77KtNWkpVe/Un2wPAO2isTkWa59SxC2Whu77hzIE5kLCbriGof/6ilwQqNrCQyvQr3dG+YkeZF4vx/qNg=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OSZPR01MB8187.jpnprd01.prod.outlook.com (2603:1096:604:1a6::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.22; Tue, 25 Feb
 2025 10:24:32 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%5]) with mapi id 15.20.8466.016; Tue, 25 Feb 2025
 10:24:32 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	"linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>
CC: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>, Claudiu Beznea
	<claudiu.beznea.uj@bp.renesas.com>
Subject: RE: Q: use 1s irqs to overcome alarm minute granularity?
Thread-Topic: Q: use 1s irqs to overcome alarm minute granularity?
Thread-Index: AQHbh28J8YkU0yMG8k62CE3d5SORPbNXz91w
Date: Tue, 25 Feb 2025 10:24:32 +0000
Message-ID:
 <TY3PR01MB1134666224CC60F280EC9422386C32@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <Z72ZFf-3Z78O44nm@ninjato>
In-Reply-To: <Z72ZFf-3Z78O44nm@ninjato>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OSZPR01MB8187:EE_
x-ms-office365-filtering-correlation-id: 42e1b8c0-febb-4eba-d362-08dd55869861
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-2022-jp?B?K1Z3YWp3R3pHTWVuVTBRZG85ZlJ6aFdPMHVjSzluZUViS1BRcklWVDk2?=
 =?iso-2022-jp?B?ODFpSGZ4Nkh0ZVJuaThoZmQrLzVYZVpWYk0ydXNab0dVdE96UjU5c3U1?=
 =?iso-2022-jp?B?VWxIQ1A0SGJjYVBOdUhSUVlqcmRPUEhoM3NaQ2RPUXFtUTlmRk93NEJI?=
 =?iso-2022-jp?B?eDV0WlI3dWpVaWFQbjd1Q1QyMGdTeHdjdEVhMUFjZDlJL3RLUExUTENR?=
 =?iso-2022-jp?B?NmEyWkFBZ3E5ZlZnbjVjMjF6OTc2bXNNRWtkeXAyNmY3SFlKaDQrUldQ?=
 =?iso-2022-jp?B?MEdMQU1KTW5GRkwwVllqQjVwM2dWMTY1Yk5nK2VPMTZJbXRLY1I1M1BZ?=
 =?iso-2022-jp?B?NlVLTzBIaGdqcDIrRXc4dVd3ZEVCbVFKckN3Q215M3JZcVdJOHM1Zk50?=
 =?iso-2022-jp?B?MmNKR1BFSTdEZXN6TFdMZlNKZXpMVDhMZ3JqMlhxVE1XZFF4SHpxOUNH?=
 =?iso-2022-jp?B?c2haZnZyZjI3Q3NiNThQTGlsZ2U2b1BsalIxblN3UExTemhFNGNlYmZs?=
 =?iso-2022-jp?B?bkQybkRlYzB4WW9ya2xaTVIzTlMwTU9XNnJFUmdvakoweUt2b2t4U0Vq?=
 =?iso-2022-jp?B?cUVCSFI1MUxkSlAxeE9ZRzNGbnF5TG1VZVNscE83VjArN0ZEa2pzRWNV?=
 =?iso-2022-jp?B?c3FQMkVla2N0QkhoVjZRQ050VTJlVVZ0TXYvalBiQlUxZmg4dTl2MStk?=
 =?iso-2022-jp?B?UjJKcytWUXBWc002YWFFb29WNHZUS0c3dmJwSjRxVXVLZ1dZeXU2TytT?=
 =?iso-2022-jp?B?eGZJWTdmSllpVFBESFlrNVQvYXZMWU93UVdIQjM5cHlkN29TSHBHNTVB?=
 =?iso-2022-jp?B?WTBZTTA4ZG83USsyTytYQjQ3QlVCUWw3Tksxc0pUWGVXOVlFTnVQaGF6?=
 =?iso-2022-jp?B?SmJMQkpzNG9FQnR0c0xqTDd5R3pQOVIrak8yUnhJT0tHUkM3OExTU09M?=
 =?iso-2022-jp?B?REQ3NmlFSEZnYnA4WGNjd295TlNqNjhTaFY4V05OV3Bwc0JTVUhnbzZP?=
 =?iso-2022-jp?B?cnJiZDRKYTBaUVl4LyttM1hQTEdWTG43YndWRlY0VEZVVXJhRWUzWkVS?=
 =?iso-2022-jp?B?VlZxUVVYMEJXN1RRZEVBL3NBMTJ0THkxK0hTM3Y5c1ROZUc0UkxDWElh?=
 =?iso-2022-jp?B?NkJUY2haL2ZtcEZrbkd3SXFSSUZ6c2tneDF5eVRkR0Q5Yk1BS1R3dVF3?=
 =?iso-2022-jp?B?N1dlOXo0TUhnM2thbklvRlV0enM1NXFyWWYrYVE0ajZvaGdXOFJ5UjJ5?=
 =?iso-2022-jp?B?M09ta0F1VFF1cFc2U3RyNVR5Z3lSSWVzaXk4T0FPZjgvV2IrSFJ6Vkxr?=
 =?iso-2022-jp?B?enQ5TGNQTmVzbGFUaXVzczRTNmZlUTJCYUNoQ09vVHBUUXFpU3Q0L1NG?=
 =?iso-2022-jp?B?b0djWkxiMlpCMEt2a04vUklTa3BiQ09EcmxFeTQzQ0Z4MkZQT0Q5ZzdD?=
 =?iso-2022-jp?B?M3NLVXB6K3l1bTNrb2Z5TDhRRG12UTJlQ1JkdGN2TTAzL1VoYmlOaVJI?=
 =?iso-2022-jp?B?aUZTRVphb2Q5YnhHd2hUUHhIb2tUSkN0R2N4cFQxVldXYWpDVDMyNkdB?=
 =?iso-2022-jp?B?RDFPeXlvVjB2R1RvV3JMRUZuUTJEKzFibE1aT2JUZDhFNHBMZUF2Nkhr?=
 =?iso-2022-jp?B?VnFZS2c2KzdVeURTY1dpYTFmYjNJM3A5dVpiNkZKWFFPQk5jczNDOVJw?=
 =?iso-2022-jp?B?N3JySTVYYVdtVXo1d1FSeDkzWnN6bHZETlZ1cmd4WElnVVlCVTM1U2Ni?=
 =?iso-2022-jp?B?bERtVjZZc09QczJvZTlLSnBESGRDaU9sNUYrRTY5OGk4Sy9kc0dyTFVa?=
 =?iso-2022-jp?B?dEJ2Y0RJNXNsN2xTWVBnaDJYbkI1Nm5HNzlNbHNiaUtpVFloOGxhN01M?=
 =?iso-2022-jp?B?S1VUeVkyTnRpL1NGV1dmZVg0YlYybGF2UVkyandhT051bGtRWGVkNjNj?=
 =?iso-2022-jp?B?a1lQNHRjWUlZcFNBRTl6WkhqMjA1Qm1Qb2tlckdzZ294SWhFbXBLNUUv?=
 =?iso-2022-jp?B?TGZDSjZ2REFydkJyQmNIWDlVUUg4aklaelFlaDhHOHVOMmtieFY4N1do?=
 =?iso-2022-jp?B?ejVselI2a0h2QTFHRlhXazU5VnozYXlTTStIckdrOHQrdzBhZG40SGd6?=
 =?iso-2022-jp?B?NHQ=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-2022-jp?B?U1o5STQ3bXVncTQrOU14ZCt3Z3dNdnN0V2E2V09Sb25UN3VDL01YeUJh?=
 =?iso-2022-jp?B?QzRDdmNYK09LaXRBSThjZHcwSmNtU2NyWkJVZTFvRjZnSnhKb1VQSlc5?=
 =?iso-2022-jp?B?NXV5ZzlDRzdEUy9kd3hHMHdnK2xsV2xxNUF0OWYvdUE5RElxUDdKNEE2?=
 =?iso-2022-jp?B?WFJySEsvWUlQaWY5RmpGZVk4em10d0h5Mng2eGl1aGFpY3orUXJRSW9W?=
 =?iso-2022-jp?B?Qmg0UEk2d1ZqZU1PR2dBN25YREM4UnZBUHZvWEc1WmFzaTg5RzRDeld6?=
 =?iso-2022-jp?B?dUk5WUwzT0FCZVRSanJ1ZmZVUEZPakw1eERJU2lKNEJUQXQ1U3VwTmE0?=
 =?iso-2022-jp?B?RExPRHFNNjBRMW1wZmRHSlJzZFovRFNxTkFYenIxVlBSeFhmSXJ5SHA4?=
 =?iso-2022-jp?B?Y3NCcTZMdE1HcnVGc1huc0dXZWFzNnNvTjg1Y1FwOC9oVXFBd2JYd1Zm?=
 =?iso-2022-jp?B?czhobXBJeVZXbzF3Nmx2aFhsUFFuOU15a2NNbW0rMjMxTVk3RzdYM1ll?=
 =?iso-2022-jp?B?YzZBTUdSQlNSeWRoWTAvQVhMM0FSNzJoOXIxa2JvMEFNanhZTUNqV2lC?=
 =?iso-2022-jp?B?M1Q1TTFwZWtvbjhEZ25wOVpHRzBobnRzU2hyOE52cTFzZmxLa05tWnpw?=
 =?iso-2022-jp?B?ekpSVnU4d2FTSUhzcGpmSlBEYk9wWXh6cENMQ2VOYURMYXVCNmJ1NFl0?=
 =?iso-2022-jp?B?S1B6NXFGOUdSOTZ2K3JuVnU3dlAwRE9nTkR4MjBkd3dBT0FiekwxRDlZ?=
 =?iso-2022-jp?B?V1RYNHJPL2hLMmlrVU1vUDJ2VnJVZ1luVjNUOXJMcmdoL3Rldy9OYWhX?=
 =?iso-2022-jp?B?SDJoN1hWb3dFYTF5ZUI5OFBVY3JVV3Q5UEs1Mi9qaXBCQmIwaDFncmZP?=
 =?iso-2022-jp?B?WU5mRlRRbksyZytsZ3BBVktDSE4vanVpTEVOV2k0Vm5FcUZYSVJHVmN0?=
 =?iso-2022-jp?B?STh6R1FEeHlvaythai82STB1SzFwaFMxT3J2enVlc1d6WnlGcUVFeWoy?=
 =?iso-2022-jp?B?SndPZmlobm5GOGNwcHk1aVNnc2crQXVxM0YzdTNienhRSTJsOVU0SlVa?=
 =?iso-2022-jp?B?R2JDTVdxVVBzakFYbW8rQlE1Vm85eUtwcjRCUEVzVDZ3aTIrN3BLTWZ2?=
 =?iso-2022-jp?B?TjBsMnlaRDhWQ1RLbG9DZ2ZWa3F2ZGZ2MDFNNTM0T2pqTTBuTCtGZWFO?=
 =?iso-2022-jp?B?aEZaWmc4YXUvb0k5RnBWNytpVW9wendhbTFjeG9hTnFpdSs0Q0NiM0Rk?=
 =?iso-2022-jp?B?ZEQyN3BwdmJlbGFGR1ZTMXB1ZWdZL2twUlgvWlZMY0lXREV3aVk2VkhI?=
 =?iso-2022-jp?B?d3g2Q3R1Nk5sekNGQXdxaVhncEVMVThIaEJKQW1xeWs1SllvMVZXelNG?=
 =?iso-2022-jp?B?ZDlPNG1zSTBXUmQ4WVVWTk5KbEVhaURPeW5iWDFuaSthcDRxSTM4UXZp?=
 =?iso-2022-jp?B?YjlYbWtqazJwMEx1WGE1YWdBRHBuT2lxdk9LRUt3d2EzYVF4VXduTFBu?=
 =?iso-2022-jp?B?ckVpZ0VzU1RwdXNTYzZWL3kvM1M0Q1E2cWY5R1dHZWVuRU9hTEM5TzI0?=
 =?iso-2022-jp?B?aEZvS2wwYWZ5Tk51d2dhQWlkNEZjcWM2em9kK3hTUnRpYm9IM3RLQW1T?=
 =?iso-2022-jp?B?MU5MTkRZUEg0SzZKWEY0bVptM2l4eCtjVDErR3JWakpJcEtDTlp4eVUz?=
 =?iso-2022-jp?B?eForcjNxb2pRcFNGczJkREVJYjIzd2o5SlNSbGlDVDRTWnAxeXFyclZW?=
 =?iso-2022-jp?B?NEdUWlNXTXFNamlJdVg1a2tCYndKdCtEK3dYZGtBaTl4MDlqMFZCckJX?=
 =?iso-2022-jp?B?NEpINS8vdlI4K0JQWVEvQlhQeHRmYzBYQng4Yk1FNzB5SWgyUyt3NkNV?=
 =?iso-2022-jp?B?c0FRazNFMHRYY21yOHRQU0NtcnBwVWRuSXpjbmUvSnhnU1JhMmhGeEFi?=
 =?iso-2022-jp?B?R05ock51ZC9pRmt0Z0RuRFNnN0prN3Fkalo5T1Jtbm5aUmtUUVFONHAy?=
 =?iso-2022-jp?B?cGJhNW1HUHZhbzZIejZYenQrWHJ2eTBKSEh3ajQyaWVudktVNlBENEhL?=
 =?iso-2022-jp?B?RUdMZ3ptZzlnOW43SEhuWXllcHB1ckgwZEJsYVpaa3pJb1ZNZ1BJUlhn?=
 =?iso-2022-jp?B?Y3VhWkhSdzgzOWJVVU1jRmsycEZuMUNLVFR6cnRoY0FFSlNiVlZnWU0r?=
 =?iso-2022-jp?B?NXRmV3RZdFIwSVB3ZDluemNvSWVvOGU4N3Q5TmRsMld5bkcxSUZiVUVn?=
 =?iso-2022-jp?B?dzhNWVh0d05Ia0hrc0Q2ZnBzbmRST2drL3Y3Y0RTcjhEUFFnVE92ZEsz?=
 =?iso-2022-jp?B?SGdKeTZzMjg1RjF6Z3M0dXBTQVFQK1Nnd3c9PQ==?=
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42e1b8c0-febb-4eba-d362-08dd55869861
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Feb 2025 10:24:32.6469
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /qjGixd5LWsLArkyORd1/k2WkVIZ/YEjA6hFRLhatelQLtsyA4JMh9IBhW8eJjdI7YlzGkW3Lympoo9kuB5xrxDSpzifw8KgBmoDXRTkZEU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8187

+ Claudiu, Looks RZ/G3S RTC can handle it.
=1B$B!|=1B(B=20
Periodic interrupt (PRD)
? 2 seconds, 1 second, 1/2 second, 1/4 second, 1/8 second, 1/16 second, 1/3=
2

Cheers,
Biju

> -----Original Message-----
> From: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Sent: 25 February 2025 10:19
> To: linux-rtc@vger.kernel.org; Alexandre Belloni <alexandre.belloni@bootl=
in.com>
> Cc: linux-renesas-soc@vger.kernel.org; Miquel Raynal <miquel.raynal@bootl=
in.com>
> Subject: Q: use 1s irqs to overcome alarm minute granularity?
>=20
> Hi,
>=20
> so alarms of the Renesas RZ-N1 RTC can only have one-minute-granularity.
> However, it does have a one-second-interrupt. Has it been tried already f=
or some driver to use such an
> interrupt to emulate second-granularity of the alarm? My searches did not=
 yield results so far.
>=20
> So the idea is, of course, to the let the alarm fire on the minutes.
> Then, enable the second-update irqs until reading the seconds matches the=
 requested seconds of the
> alarm.
>=20
> It would not only gain us a better resolution for alarms, but also allows=
 for enabling UIE.
>=20
> I get it that handling the different interrupts may get tricky if e.g.
> there is a change in the timerqueue while something has already been setu=
p or so. I need to research
> this, I have currently no idea how this is handled at all.
>=20
> But while doing so, I wanted to ask if there are already opinions if this=
 approach is feasible or not.
> I can't imagine that I am the first one to try it, so there probably are =
experiences out there?
>=20
> Thanks and happy hacking,
>=20
>    Wolfram


