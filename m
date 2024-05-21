Return-Path: <linux-rtc+bounces-1204-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EBD18CA848
	for <lists+linux-rtc@lfdr.de>; Tue, 21 May 2024 09:01:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ADEA41F22257
	for <lists+linux-rtc@lfdr.de>; Tue, 21 May 2024 07:01:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E2392E85E;
	Tue, 21 May 2024 07:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=epec.fi header.i=@epec.fi header.b="lwqnERdq"
X-Original-To: linux-rtc@vger.kernel.org
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (mail-ve1eur01on2115.outbound.protection.outlook.com [40.107.14.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D44A27F;
	Tue, 21 May 2024 07:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.14.115
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716274865; cv=fail; b=FVjFcWacaFitGEWb1SC6Tcd67hIpy5SI2mPF5NnQkXBkLxelEiJetH076d4b0wqKIU1zWRwiN2mps3EZRKxACp540LrlezuMxkxWwSI85ReMjdd5ziAYPP05q/826cUZy6fo68RPtLhriCy8g0mVnkmwB9dvYJ7+hzSQf7mhx0U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716274865; c=relaxed/simple;
	bh=/4q+nBb16DllD1u10XaO/mYU7Ag7zTTaArcZLhdVP14=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Oy18rwO3CQbapk1kannCfMGqVo6i+YzM+zffAzfgfK8QhY5YvLYHw2+hX1YixqhcwTkVJOGlOLspZUK6FvmVFDyjlTfJktZDczGHs7nZTttdxGIlP/RECoCbqlAk0//Sg5xF/nKjVuClAt5pC+UUo2OM+Bs86KKSQWQv2c8aND4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=epec.fi; spf=pass smtp.mailfrom=epec.fi; dkim=pass (2048-bit key) header.d=epec.fi header.i=@epec.fi header.b=lwqnERdq; arc=fail smtp.client-ip=40.107.14.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=epec.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=epec.fi
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gjsIgIUrLJ2mvfF2hqqOKuJzJ7OwLD9Jb/GUYh0FugXDS6BhXw9KdCpPKGHjIheLNdUUlqwPFQXOBGyFnJynvxvfWZmdZoBDtzO/nJ8YGZVbJHDyM5IzPE+DOYMmkR6WlJtHjdQVEO0uQIfl1owmR9ty9IhXNGA62R7Ui1cWUD2dsozRd0pyuMWXX3DQa+Jey36R8xsr3N6e8XBYrj2SOT48uEq859nxCY5evVav06rGbt148KCUZt2y76AGmSIVrw03KS/KWcCJj1/g9mmfCcaulEZ0PsJcDa4hhYssgsTUaFnYs2Fm6gYv7DL1yqp8zex4CEIbuBoGSZ/cdK/VCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/4q+nBb16DllD1u10XaO/mYU7Ag7zTTaArcZLhdVP14=;
 b=kTqsACO3I49mYFoErFDmdgoDSPXGb76fFGdpMHtFoYjdDz2VaX0W0gND5jX/Z9XCkBlMr8H+lIAypj6jzFHYcSEvr2/VZk+HqEc0sJM8IlXvo11maKYRy+gNSVMfAhORNhm/Il5TS5CIGC4vuGKPy07Q7q4OectsR4ZNxIRfPA6w8zOgLNwdEYo/MFVse+hVsrqnPVpQktJ85G6bVCUi3zeyP6Ccof0Cu+WP9v7p4PhbklxEZ72LZgceTUbGxCnqHK1S0NAf3jSekxQm7ORQbkS+DH6mwCfAXTsw8c+tRKjyRxwgX2upZOfAB75pux6lKx5IlXErshOqOmZrne6oHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epec.fi; dmarc=pass action=none header.from=epec.fi; dkim=pass
 header.d=epec.fi; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epec.fi; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/4q+nBb16DllD1u10XaO/mYU7Ag7zTTaArcZLhdVP14=;
 b=lwqnERdqIWd2YFFWhveiPTS/e0fmrIJzI1xybgHUfBaF+xIcnuhwF9m1a44djJcI6jT2gMw1FXsK78i7hXL8P67RTr3b1NweZ5Qg8TnlAcm61hDBSJSRR0Syc7pp1pEftxeEGTCSy5sy2Ko5Iv0yKG1FbneL67Ac4Mq6rOLNHVzdMuHCmw3wUsGvXBs/jcXmyM54/pwlC7KpR5+icNmpv9kCUuD15UbeKpBCabYcX6RuaGT3NKT5VZS/QhujrF57yfFfM4EoG1uufUktNUDXFvMUC/Ys6oEsApGTbTDZ7zEVMJUEbN4PFLZ/mZZ2IVUA7h4E4sjIozlSqAJBSVaTvQ==
Received: from AM8PR07MB7475.eurprd07.prod.outlook.com (2603:10a6:20b:241::15)
 by AM9PR07MB7156.eurprd07.prod.outlook.com (2603:10a6:20b:2cb::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.35; Tue, 21 May
 2024 07:00:57 +0000
Received: from AM8PR07MB7475.eurprd07.prod.outlook.com
 ([fe80::b33f:8297:3be1:a2b]) by AM8PR07MB7475.eurprd07.prod.outlook.com
 ([fe80::b33f:8297:3be1:a2b%5]) with mapi id 15.20.7587.035; Tue, 21 May 2024
 07:00:57 +0000
From: =?iso-8859-1?Q?Erkkil=E4_Taneli?= <Taneli.Erkkila@epec.fi>
To: "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>
CC: "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: R rtc-ab-eoz9.c alarm hours work only between 00:00 - 19:59
Thread-Topic: R rtc-ab-eoz9.c alarm hours work only between 00:00 - 19:59
Thread-Index: AdqrSzni2Ad14JUrQl2nxk+bsinRNgAAWa+w
Date: Tue, 21 May 2024 07:00:57 +0000
Message-ID:
 <AM8PR07MB74750FE9B3F733C13D3CF9768EEA2@AM8PR07MB7475.eurprd07.prod.outlook.com>
References:
 <AM8PR07MB74754C6990256F36F81A7F468EEA2@AM8PR07MB7475.eurprd07.prod.outlook.com>
In-Reply-To:
 <AM8PR07MB74754C6990256F36F81A7F468EEA2@AM8PR07MB7475.eurprd07.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epec.fi;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM8PR07MB7475:EE_|AM9PR07MB7156:EE_
x-ms-office365-filtering-correlation-id: 528dbbb2-0963-4dea-4a8a-08dc7963c3e2
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|366007|1800799015|376005|38070700009;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?aYkIU8O8OkbzQ83XkLS5+AsbHE9pHMWtc6e+TGa26QCIqO8F0ntWF/eSXU?=
 =?iso-8859-1?Q?BmyNruCjhv8IGX7z+Bnc+RuNhB+v4GyRXEthPUvsNBWKu1LxK2eqmhEyCu?=
 =?iso-8859-1?Q?Po81we9r9RxLj4u6NYSIOsfd0NiFlOYU1ZrJL7qrQnQv1uedEh/9dnDsRr?=
 =?iso-8859-1?Q?d+Sp9VIjjf6xDt+VT1sPggbBzK+XL4VvxxF+vHGlmoyWqeEzWrRXRLPAWE?=
 =?iso-8859-1?Q?L59zl7nWK7CMAUmWZA5EjEEdiKRD2MZLGtNV9s8q7wam2B9yfRQtcIJ/tI?=
 =?iso-8859-1?Q?gOE/Ewj4tAGyTcYup3lSsBEfnk3OcNUoz2u9eEUTci5ijZ5KkNhcg0pJOo?=
 =?iso-8859-1?Q?8cRVx4eVC3lSQleMgtiwadK3RtzNraBBVBlBDZGkjr7w5xeFESSblX6ojv?=
 =?iso-8859-1?Q?WnkL+Tt95yG365xTXzw4jocLNKF/3QWFJId0xbzYflhW2p1+RwZYjjoHWB?=
 =?iso-8859-1?Q?EhRlXGHxREgSsDwI99nhDlpZbaUnIOTEBIYja09GdLn12umN+eQTHDm0p2?=
 =?iso-8859-1?Q?20FXCojGp4m9766Zh2xtN0bZyTwembyjS+AsZqMmd3DjGi6ZfRu9CnwbKD?=
 =?iso-8859-1?Q?VNw6fwWLGPxwN3jKfuxRI7BI5YbZG8d+S0FSefNghAeWfq0/oJsp/Qikq8?=
 =?iso-8859-1?Q?fIyT/+XMS8jcpoapdM9ai5klUiax69umgw+aDv9eHjSrx1Skt/60AEPxwk?=
 =?iso-8859-1?Q?GC8SaL2iV8LK8axte0k03n9INhfjDpY+hmk2xQJrzK3K5sx5B4dXpWe7UB?=
 =?iso-8859-1?Q?dFVS+94SlUKdEFayrapvw8wOgDxAOEBTyuuPiuHlCPhM2KFUxEW6jaVzid?=
 =?iso-8859-1?Q?xUtim6+3v8ydxxkTZPtsyN7UknBVstlF1ohuSHXLYP4eYqaN752gDfQdbJ?=
 =?iso-8859-1?Q?16CsTVDNbc/+xdgzUXdNCmt33BzOMCkYaIsMQZSiOuqIJ5HAGm2peRB1Qn?=
 =?iso-8859-1?Q?/HD23wMeAVJix845e0n7vmCbBrsvxzfl8BzvIr4v+WGxvFgqvsOl8CEeg6?=
 =?iso-8859-1?Q?XGguNXNinDhCaud5oC911sPdMQqKIsR48Mz+Q9aoCa1ISG7U6shDcY5/FN?=
 =?iso-8859-1?Q?tDSQk7i3tyXOZaycGl0U4g8/Ocdr5I89IZJvG6qJGeS4hc8JZmZ7CB1hxy?=
 =?iso-8859-1?Q?vpPOhOVZ0PAyrWkYlcxUUIw9GBaczTRPFjEzPDkN314KLa6EBB6C/ceZw0?=
 =?iso-8859-1?Q?CKRNb8M0yUWB4tJ9/41QvMvvLUJQPJrhZUL+oAxjjy6WbL7tXEUH8zyso7?=
 =?iso-8859-1?Q?2gX/NnfHnLJA9r8OzGtccRBKkafJ2FZlI5Dn9ztLGFPm35eEyIxXkVeIKs?=
 =?iso-8859-1?Q?7ZnnfgyaFfuBsikZYlRZKYVV1Q=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR07MB7475.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?WuBVU3DCv7fa/atPcpyBSBsScARmhiSCoqLKt85xTf613wqUAM2ixSaLc0?=
 =?iso-8859-1?Q?Od1NMBd2v9gIf4B2bNoOKDS6WSmCFotaBs/c4isr6CWOvIBPeYkvtcCR/h?=
 =?iso-8859-1?Q?YpnMnkT2+UAs1ROZexitxX2DswNnpf1ZyoGcVgP++aeSJyGxzgKtlKCZ7D?=
 =?iso-8859-1?Q?8L+hBi2QRuyVcHdF8v6R+CeImleilQxqay4VrDAWflAYcE9UkHPutRZWh0?=
 =?iso-8859-1?Q?xhdooVAtF573mQAbRC2DcPEcac/MBkIbia91bNTz6Pe4yB8pMyAHZkt3+N?=
 =?iso-8859-1?Q?Z8tgXY/Gsl4+dkTa3rKemERTFHa5z54lkIG5+5xngj9IX6BDsD44vUqObM?=
 =?iso-8859-1?Q?9X0kvynbPuD+gdfxTLCQtzPThwP8b5rMKa+MQH226EWGNXjCEdVzn/iFQh?=
 =?iso-8859-1?Q?dofpswC1g8j+32vjRQjOwAVB5Gmr7GKZQbmBHQMfrUcWdaB3mHgOIUOgaD?=
 =?iso-8859-1?Q?w3WZw2xM9YJ0cmphzxsI0ku14hFerRG2Wdu0YMkiBb1wY4NW1qwc6u24TQ?=
 =?iso-8859-1?Q?Z0/z9+dmVxSUGeAUUy5/SS0bzEhQXA2AKJP1lNMSEi+sAtyVtV7f6BuKHB?=
 =?iso-8859-1?Q?U5j3gG5ZJfnsM4GR56XssJ4tZGzLPs760mWX2G27N+/8E4vTYganwFa3HI?=
 =?iso-8859-1?Q?eN7aFxjLwqsX6hzrx9Nfe7WrVudOISsIB9mXslRtcrO+GopvbYuSDdnIBf?=
 =?iso-8859-1?Q?ZMmXDXoCeYlu0Rr1paoNMF4tyhtTXqZLlWqclF0Ya9D93MaKgZ5hf96V6v?=
 =?iso-8859-1?Q?HIectVHwj3WK5w7z1kqatW8vRe8d260krjxcAK/Id3vl5K8TgMjizbhuwf?=
 =?iso-8859-1?Q?0McbikdZdrb+JfdppHheSaowd9LFNlLVQNYQVTmCFKAFq7FAwypY4Lon+n?=
 =?iso-8859-1?Q?W2A+zS+/q9Y11Src2br6d7IvbvmAtsG/dpo8ndHWzx88dOkGb95g4AgV1I?=
 =?iso-8859-1?Q?vuuADzclZ89LuAWR18mGRryYutHWz6ysCoCd+UzgiTsq2GTNvDoYV/uTiC?=
 =?iso-8859-1?Q?hRt6o+ij5v6DvMC/pDbDxJX+sC2HrmIzVbY6SozaTEIOPRMkNvpYjGP0tt?=
 =?iso-8859-1?Q?x1D9ohV27GXyI0Vo9Yy8Lq5kcXlaVv+94lRw2gDKFF2w/tANEs6iUzBwG8?=
 =?iso-8859-1?Q?f6bjCzrEhhXdhu4AoNpJa4S97SepP3r56TkhKHXHfv85VLtPbyyRDxL8uX?=
 =?iso-8859-1?Q?Jj3iBTbiASyYSeESwLAthLE+FTzx8oHqPoKW6plrmJQ07u55N4N7ywpc4w?=
 =?iso-8859-1?Q?4k+weNAPmcFtklCdRpQd/YW1Bw/D/RxlbyknxcM35USPn+yCBxHMZmTX4H?=
 =?iso-8859-1?Q?RaEmSae0Mm9vffSxqfCCy1JUS39C1e9E9X+hG0y1Vr5n4weiLaCDxszNRK?=
 =?iso-8859-1?Q?0+N/e79LryjSrtuVDy4PnipXEoFFkZ9anebc4sPfVvMEPe/3Xct0LSc7GW?=
 =?iso-8859-1?Q?F1nOuCMNJyvAm+PrT9LdFtimgj5iqWe2W+1rSFaxWZ7ZcGbdRBRPINog5O?=
 =?iso-8859-1?Q?v2Y5SdKLgLulR+3sjdysmTVSy6mT603lz7NkmDo1jRvQXTGAHT3G8oL/NN?=
 =?iso-8859-1?Q?X1OTvY4qERv+jEOytDezA0QcE+BdGel1NI6z1JupEvLTkSBVpPTurKWnJj?=
 =?iso-8859-1?Q?W+BFuuTJEOFcSK4bZM3g3YdfFfeKkBDY5U?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: epec.fi
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM8PR07MB7475.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 528dbbb2-0963-4dea-4a8a-08dc7963c3e2
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2024 07:00:57.4765
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06a169d0-dc65-4fdc-b960-aaa1fee54285
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rlGIeu26jyTffF7Fkn2XSy4y27OhNFfiwzPdNty/x2poxbnNAizygS2WTF0Fwmw9vGLqlNxbTZw3rAE2cVUpRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR07MB7156

Driver uses only first 4 bits from "alarm hour"(ABEOZ9_BIT_ALARM_HOURS) tha=
t makes it work only between 00:00-19:59. Fifth bit tells alarm time betwee=
n 20:00-23:59 and it is ignored.


Index: linux-imx/drivers/rtc/rtc-ab-eoz9.c
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- linux-imx.orig/drivers/rtc/rtc-ab-eoz9.c
+++ linux-imx/drivers/rtc/rtc-ab-eoz9.c
@@ -64,7 +64,7 @@
#define ABEOZ9_BIT_ALARM_MIN=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 GENMASK(6, 0)
#define ABEOZ9_REG_ALARM_HOURS=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 0x12
#define ABEOZ9_BIT_ALARM_HOURS_PM=A0 BIT(5)
-#define ABEOZ9_BIT_ALARM_HOURS=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 GE=
NMASK(4, 0)
+#define ABEOZ9_BIT_ALARM_HOURS=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 GENMA=
SK(5, 0)
#define ABEOZ9_REG_ALARM_DAYS=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 0x13
#define ABEOZ9_BIT_ALARM_DAYS=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 GENMASK(5, 0)
#define ABEOZ9_REG_ALARM_WEEKDAYS=A0 0x14

