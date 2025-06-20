Return-Path: <linux-rtc+bounces-4325-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E402FAE1B3D
	for <lists+linux-rtc@lfdr.de>; Fri, 20 Jun 2025 14:51:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1E6275A0314
	for <lists+linux-rtc@lfdr.de>; Fri, 20 Jun 2025 12:51:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C59B828B7F9;
	Fri, 20 Jun 2025 12:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="LblwiDc1"
X-Original-To: linux-rtc@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013044.outbound.protection.outlook.com [40.107.159.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C804027FD72;
	Fri, 20 Jun 2025 12:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750423885; cv=fail; b=f/M4ZldyXjGbUsLsmjPYqeIX+h4W5xGalv1wsaYEdXmNiaV+TVmigdy48NmllcViP+I7M7BnUr5F2HzQdsPYWxNG7Ybbu0FPutM7U4T9+aAQ/xzDQShVrX1OSfnhpPa+ZV7UZsXwGAG9mgO6bqtQ/BpZUBL5RkdRpWT/0TnurqY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750423885; c=relaxed/simple;
	bh=S+qY9s/RgpH7aiXWmW09vza8d9Z75jxSqAqW6olZsSs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=srTGp101AkCnW7JwsW/bRXQAyQTbnJm9Urwb/IOuHACMd1pWsVCpbaeUchDS1mU9ryjMuQQsnQgKi1uKXNx0aYLR+kaHm1gXwWieA/5h4wU5PSZMDcRlcMNbvt/6I8J8wMkdLDAco3jxmqxxDQsAhsjTgRKdrCD7BCKkfXML2l0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=LblwiDc1; arc=fail smtp.client-ip=40.107.159.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZgLhhSpIUYdMPJKMdXnsgWnV3TZTgZs1mkHZbMC3fz5SrNK9DAhl7KJWCsy0fKXnetHO5lyF8c7kntye5WQd1VGbd6D593oqEsPO7y356ms5BigoXQZX3NH0Yh904OprRauxwE57os83JWvrxgxod6XUb7UET+zr4+E2QG6fexJWzqRenwzCN7Otu4WSwRaNd/I3NFvekwW0XXfTZf3FB7A/90E9cCKb9UzW39Eobto7qjI2QLQgsmWgBWSuvaEUMjsYWOEJKoht6l/VDSeBovcDvx3a97MYZB57+koeK/mgTP5EGRMdgLCHSc+tZ5+7hkohRDjrcKc8zM8kWE8bJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=09RLTgK7oZocoGGX8GpfSBNGGe/IrmyXaBEZJAwGzqM=;
 b=uyeYzXspwmU+SHYK9rPYFC3yNk72E/KdtAvx+O1tc2QI8zyDNclRqjp8qz8V8XLKQ4aR4ffGpwy354P5szx8DTsj5siq/mlC/GnI1CoKhBL/qVUdKn3+0D4YH4H5dO3cdE84q4p8Dddu2AgNqoUJLmPz9UYnd///zpDKxXdANem7bhFh8jOHywhSAxCf6b+VF8N4oBVlTBcsNDOl710OLFSemrjnq5gQiAjBK8QNNObe8rg8czzUjYHVGOycFzrNIjtsDOrbf8CpKF4myzFnqJ3FrLb3b6597nwlqFJlfByKpU7rmXWzwr3vEiT57Njj10Me3Gv1U0mxzxcHVG2gIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=09RLTgK7oZocoGGX8GpfSBNGGe/IrmyXaBEZJAwGzqM=;
 b=LblwiDc1eHiGD6Y3WfyXPmgK8DwQd2h53hJv3a7iJfrwB3iNlpErPGjFotigVf3cllTmBhjE/s+hpxorUR39bXP6SEl2xerFezfK3EloKsGiR41+n74gnIBB6B92/zHXLyli+J6f/mC/olXkWRRe+4idwyYgDj6ehkHpNhYgLQk77WO3pirVS+S9alqH8Z3GMMKcb6sqZs8JrkkHtuP28XwqROcwNReEFM1GS3a1DqRv+rleSHs7wPvz23RbTuIMlr9cSwc6AIIzVPTnxnRgBvPSblfC6J8WEqfUEVf2WVcATSKAyJZvg/Kst60lbmK9xs9Wp1OqFr/5f18NaNRIFw==
Received: from DB7PR04MB5451.eurprd04.prod.outlook.com (2603:10a6:10:8e::10)
 by AM0PR04MB6964.eurprd04.prod.outlook.com (2603:10a6:208:18a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.20; Fri, 20 Jun
 2025 12:51:19 +0000
Received: from DB7PR04MB5451.eurprd04.prod.outlook.com
 ([fe80::e6c7:ea70:4ebf:32a2]) by DB7PR04MB5451.eurprd04.prod.outlook.com
 ([fe80::e6c7:ea70:4ebf:32a2%3]) with mapi id 15.20.8857.022; Fri, 20 Jun 2025
 12:51:19 +0000
From: Elena Popa <elena.popa@nxp.com>
To: "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
	"hvilleneuve@dimonoff.com" <hvilleneuve@dimonoff.com>,
	"r.cerrato@til-technologies.fr" <r.cerrato@til-technologies.fr>
CC: "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
	"stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: RE: [PATCH v2 2/2] rtc: pcf2127: add missing semicolon after
 statement
Thread-Topic: [PATCH v2 2/2] rtc: pcf2127: add missing semicolon after
 statement
Thread-Index: AQHb0U9k/ceBGaaQ6UumeBii41pbkbQMINGA
Date: Fri, 20 Jun 2025 12:51:19 +0000
Message-ID:
 <DB7PR04MB54516E03B7D3DC2B166BBE66907CA@DB7PR04MB5451.eurprd04.prod.outlook.com>
References: <20250530104001.957977-1-elena.popa@nxp.com>
 <20250530104001.957977-2-elena.popa@nxp.com>
In-Reply-To: <20250530104001.957977-2-elena.popa@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB7PR04MB5451:EE_|AM0PR04MB6964:EE_
x-ms-office365-filtering-correlation-id: 3010f32d-1747-4461-152d-08ddaff92714
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|7053199007|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?42yThow0aqFbd+9jQzeoKSCdWwjZzHcJrTGP9ol/GZi3Jg6qpI6RD+iKjX0g?=
 =?us-ascii?Q?Xk50iK5unF/dfKCecSfQkGZQmpX8uPvsR7wbPVYc1srkQ+DA6kvnXYqigKrR?=
 =?us-ascii?Q?SvwHGI/nqdRutkUXmqDn4hJ9EW/sWc3Qz8dqN/XLVcizpIxTpgCV1Y+yoawA?=
 =?us-ascii?Q?Cq6Cq16GNcBu4W5waW27jp5xKCSwb7Dxhv1WcEAIaYV0CiPTjx9GqPduDUlN?=
 =?us-ascii?Q?YlmMbwKWB4/72wphfjW1teg1IHZ0GHLzwFBotzhluIh2P7eS6PtQr381rOGl?=
 =?us-ascii?Q?cAkuqU7oZ0zeN3WL8xDT9rNwelxgbACY1DDsgIl3za6NZeM6E8zm033owHIM?=
 =?us-ascii?Q?w0l/CoJn4Z01ZY3JXdzVvAwTWK3c/BD2HqliekGYS1muibHYueKgWJOjsr4H?=
 =?us-ascii?Q?+WLniD6E/GcDDC5AI0SO4YtIPJkB4tU4Oz6razy1HVfjpvXSVQcjXQ16jh2a?=
 =?us-ascii?Q?8MZKlCTCHng8JTq7epE/+J38ynLWJlETbwfwQLhdlIOL/EubPOJPiEwqM/5R?=
 =?us-ascii?Q?GBxjK16WD3Yr27g8LX/mL4j8yyFCvKpCUcaWmBADw0CeJi5uE9WoUrJG8bjc?=
 =?us-ascii?Q?Wci0vqDlsCZbt+Xzq06RfGzksZlycKn7XLXiotFpcgJExdecOxOUPXmEESD1?=
 =?us-ascii?Q?G6QUR7mIUGmbkU9Cmdb0R3Q4f3FEIP5CMXDnj1ZG0W//HLRgdUUu4blcyhkO?=
 =?us-ascii?Q?qnmrAfbQaGmtoavjHjRjsZpwvps3EiRmM3sT8VR6CKVTqD74LXhzRf4UvmIh?=
 =?us-ascii?Q?AKaQu8k3N+6Tt/7XcRQqwn7UAfvZGKVd/bNUD+aT5lH3wWI5lFiSsQ/VzaOI?=
 =?us-ascii?Q?tzl2AHSpOIJ5gXNlbkYAwBANA6vzZ7pTqrshVWZk+GF8mrjNVYrnLP6FeKsB?=
 =?us-ascii?Q?RifkTzBAVSszroJ+3GPUqnNwtQQCOjTk4UxfXREAFFZ4orkCtpuWXllXRcs6?=
 =?us-ascii?Q?oWj2BCGOvxlP0gKTrr9/HxM8f46d9ltADKArMnGNxAsLfal3G7PJDHIYebTm?=
 =?us-ascii?Q?+1uRrhno2asY3Qz82lQb9wHJ6/Dwk/7CurY9adoJrKN/rQo2ZvwauYjQxCeT?=
 =?us-ascii?Q?CXqL9G21z/2LMRifsQbVtiFvT+OOnEnmXkDPNb7wBiSYNYdVq/gtydbWt/xK?=
 =?us-ascii?Q?H60QQoSIDvxIR4vpLux/FxP7cUAz6iHhHRNXW3qBHY6d1UxQJSXGW3GW0y1h?=
 =?us-ascii?Q?O/agIgg7Px7rnGJghy83UrR2/j73cWj37InhKRPBBfrmqyGK+drDDzFIo2Tq?=
 =?us-ascii?Q?NFwqSgekR2QdAQfxtgdbKvqZLRU46EWHrXht1j1I5PcB/B5S722Y9AWkg4QV?=
 =?us-ascii?Q?fCvUDr/naaRpZAcKIw+d2Sd4hrogNzjTG4wTKWS32LMnXgMjgR5AkJdI1lHT?=
 =?us-ascii?Q?kzudSJ0auIPvVJqJ3TqEIUbvNL1YixHTMXSRbTBkugFkQ1trG7/HTk0oHRQa?=
 =?us-ascii?Q?c5c0F4Q4AKfxG2ApXiIdN9XeyfjQxgl0CDX11w8cyefiuEXWC1gUzw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB5451.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?hmBDbglSa+oOkBx+aGhge3AXn2h3l/m6ciXF98WgZGNGavzGq/ue29BrJDGc?=
 =?us-ascii?Q?J0Un0nJhgcXt4TpASBbcywkAHYZbUAEVFv5vvj1N9wP7ATSr4KAU0ZHHBZmP?=
 =?us-ascii?Q?WNhef5eZoU3l1RkowA3hdEcZTKAsSrWK8doaV6T3t99DkxYrgC5+Rn8fT0HW?=
 =?us-ascii?Q?1g4dnxU37hT6PuW552u6FqhTsHMVTJrqaTg/RVnK4olPNNWbfOxU1pLOuBeX?=
 =?us-ascii?Q?8GSbA048LF2PKN/u+Ufqm6fWK8VsVBFRwLQFdX4wBDQ2Uc856gj91HZB+uwA?=
 =?us-ascii?Q?KuYoesY3Fys1fRzgxlrBYIObgAIVWBwOPaytcnnWonRt6VxY8SQm4UwrY9iw?=
 =?us-ascii?Q?MGEPWl+/05CSHTtom5R4Pa5x/lRvuVj442u3MKx8KyofYpWoKa1NS8WSij9q?=
 =?us-ascii?Q?v+YStmFfn22KsBrd59xhujgF3bi4q/9+SU0Io9FLqBBrTdDMB1bGIJ6lLoiV?=
 =?us-ascii?Q?sJzWinNbguuFAFkZX1p4FJaYug3YXXJs+aioVVMrQhrZoft/ikxRyo4vKFIa?=
 =?us-ascii?Q?ZyJ38XfT59Xv8qLL+XnHtgMbXabMNtdQflCj7tpFt5Ha+dsAwzzXFF+RFvjX?=
 =?us-ascii?Q?dY/je84LqDz1Ounq0R4IpNfqGnhb2vBj23hu4k4zftrLpVDn42WfwljM5pzv?=
 =?us-ascii?Q?rvJB8c44w8pncDrq7+mbh/zE0YX/HObjN0WDAO0PP4zDXriJOSvcyP4NBchy?=
 =?us-ascii?Q?nnfhmWHM83wWw0vYeaeJd5TGeNMoA9kJHxdLxB2qDcGpLfMCxXwG6aaoggt1?=
 =?us-ascii?Q?U73j3SIjXmQNHAQpFbs2EZRMqjbTi2VFzzGv5OzfkE2hsZ9tabLbmGODgabe?=
 =?us-ascii?Q?BMqw933FufpCNwkeVnIrJW+9dLoAHKb5FLyOgWrsvyErxisfbPJDP4ztDlmd?=
 =?us-ascii?Q?NJoUd2w8I2+IcG1cr1Xx/LfScy+xloMH5pyuJz4j++46spmut+TskT94Ubjd?=
 =?us-ascii?Q?2Kvb9XbhE5D+GMSYXaXnfYnqZnW4X8UZ2m6MqT/ExnOuift/2C6FNmynjcUl?=
 =?us-ascii?Q?RwKCiBLq6pNoS/a7Oy5czvlbp3PUC/KaWuIZoeeARiL7gw64aJrwZktQLWLY?=
 =?us-ascii?Q?gIzPquiNCUSgQXMP/EyEi/2vfNrd+SuwIcCOSYtZ4knVvBt/r0+AZt5tr06G?=
 =?us-ascii?Q?lKoxzF1tc9iwto07RfY/BzrMMCwY0qL/pTF6N6Bzg8489klBx8IoGVDAQd7N?=
 =?us-ascii?Q?Gi+IvSA1eFzHzeSuoWwNc4r25KtThB83vGuTgqZO6j/Z5QGgyL/Jagf6Uh9k?=
 =?us-ascii?Q?SCS5lW4EaYQMotw+NmHgy9OHMHMtmd36ekZb/rDxb2n1t6ocvxyTSLFnnn/B?=
 =?us-ascii?Q?IlBDh/hy8CVgIo680S1C4/y6zhSqSJAj88ZI+rxsmowGnLj2tRpx5FNqV8xN?=
 =?us-ascii?Q?IM46VbVXO8dW/wCBZCgAwGtMgWzJQL0pysx7TnOpy41MKCqbYfFLLTDtfhaa?=
 =?us-ascii?Q?TwPKy1pIpYgdJW61LMS+OIzFwKIBW1dF/eZPHl6vwnuxzsGxNtacWW6oRAZG?=
 =?us-ascii?Q?2vHwhXJMq8qnawXWcR6/RSEIzm8n9WqW2g+cjTzz+l2oQrh4p/dcVGi0wL3I?=
 =?us-ascii?Q?0eL3lyaKUcCAEfyATvu+k0xaM2z7QwdSO010jNSG?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB5451.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3010f32d-1747-4461-152d-08ddaff92714
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jun 2025 12:51:19.3544
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: G94yY65ghnplSsqgySrnmlzyvttcZ8wpl/h0qwfoWEM1uufOoDuVRi9XJ48XbcG7hrwFQe6Wtu0CbTJe3rhGlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6964

Hi,

Any news on the integration of these 2 patches?
rtc: pcf2127: add missing semicolon after statement
rtc: pcf2127: fix SPI command byte for PCF2131

> -----Original Message-----
> From: Elena Popa <elena.popa@nxp.com>
> Sent: Friday, May 30, 2025 1:40 PM
> To: alexandre.belloni@bootlin.com; hvilleneuve@dimonoff.com;
> r.cerrato@til-technologies.fr
> Cc: linux-rtc@vger.kernel.org; Elena Popa <elena.popa@nxp.com>;
> stable@vger.kernel.org
> Subject: [PATCH v2 2/2] rtc: pcf2127: add missing semicolon after stateme=
nt
>=20
> Replace comma with semicolon at the end of the statement when setting
> config.max_register.
>=20
> Fixes: fd28ceb4603f ("rtc: pcf2127: add variant-specific configuration
> structure")
> Cc: stable@vger.kernel.org
> Cc: Elena Popa <elena.popa@nxp.com>
> Signed-off-by: Hugo Villeneuve <hvilleneuve@dimonoff.com>
> ---
>  drivers/rtc/rtc-pcf2127.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/rtc/rtc-pcf2127.c b/drivers/rtc/rtc-pcf2127.c index
> 2c7917bc2a31..2e1ac0c42e93 100644
> --- a/drivers/rtc/rtc-pcf2127.c
> +++ b/drivers/rtc/rtc-pcf2127.c
> @@ -1543,7 +1543,7 @@ static int pcf2127_spi_probe(struct spi_device *spi=
)
>  		config.write_flag_mask =3D 0x0;
>  	}
>=20
> -	config.max_register =3D variant->max_register,
> +	config.max_register =3D variant->max_register;
>=20
>  	regmap =3D devm_regmap_init_spi(spi, &config);
>  	if (IS_ERR(regmap)) {
> --
> 2.34.1


