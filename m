Return-Path: <linux-rtc+bounces-6258-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wHwnCmH2x2lMfQUAu9opvQ
	(envelope-from <linux-rtc+bounces-6258-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Sat, 28 Mar 2026 16:40:17 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7572F34EF24
	for <lists+linux-rtc@lfdr.de>; Sat, 28 Mar 2026 16:40:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C30E43003ECE
	for <lists+linux-rtc@lfdr.de>; Sat, 28 Mar 2026 15:38:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4ABB7339853;
	Sat, 28 Mar 2026 15:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OOOnzT1s"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27B37194C98
	for <linux-rtc@vger.kernel.org>; Sat, 28 Mar 2026 15:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774712298; cv=none; b=Cr1LrSHEmFysMDdC5hZaLZkiVUHhlUVZzdvHRdk1B0An/hoD0leVFyh0+ZqMM6g9IAbLzz1C2kB613tZHwboYzOiNgqKRKzj/3e4EKWInn08xzyEm85JWH2LaKGdnIziYoVgIBmz/HUG/dmjFlE6BsbLD99rQbhRRlr5XFEO90s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774712298; c=relaxed/simple;
	bh=BEU9rMTbOAWYA1FwR7F4qwNiCjzAb+HmPpFgx2cS7wE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ID8oNDrfkE6CMfMOk3bm9+NSOwGA1vg+Sqvj+CL4agSv33kYuJxZsuPaEIZ4kJtpDBXolLkYrRn7ajz33QUPZAcdnW4IrIq/F107eTYML2Mr+pjyRWmR/EgtMUgtsiiR24Lt7szmMF11oCXTqjKd1IMAbcstiNShn2zdx8VtFtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OOOnzT1s; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC6EDC4CEF7
	for <linux-rtc@vger.kernel.org>; Sat, 28 Mar 2026 15:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774712297;
	bh=BEU9rMTbOAWYA1FwR7F4qwNiCjzAb+HmPpFgx2cS7wE=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=OOOnzT1sRUP0H/syN9/3BNayH0iKYLspaybj6pRMKCW+v3vFiJjle1TIBzNpdrxGA
	 r2fb7xtjstVVEe6UcIYg6Y00K3ZdgsAWWHlQSOGllS+BxMLEAYzKqf8GJSck0F4z1t
	 9r3j4ptY/JAM22iCtGCtnozJE7ArYJPfK1d30iAI8rdi7JXvBeye7RIcHioTvB4N/k
	 /XhbvdpHa7srWCSCN8tItawITIo3CJsnAa7EdNqxQ9MQg/S5SLpOzq1DCYUpsRcw28
	 23nMuN7Fz32oOANN7vtnfHiQqQrGeWyETatktfF+gxx2Inf/hSaloasbP77cy9XsSf
	 Eogj2X0d/Icwg==
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-66b32fd9f26so2111951a12.0
        for <linux-rtc@vger.kernel.org>; Sat, 28 Mar 2026 08:38:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVzgR7KtrJqoVt/vrkwY4cS79qHd0xJIJqKg59STK8JeBcBBqE0yVHzw9a3IzoKzQ42BnHjIGidEvI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3P5+gNEOV8yRfTdpMbQJQiaWwMyh68bSoAENxfMDDBpz4piOn
	8SNlMIGrT49Hx1kULnB3BsfkN7Uw2R21nhSeHTJFt++IcHFOkpfjWCffsAnqbOl2ThzDXErrcq3
	+lalm7ypTEZAxsqgzJHVERq3GOcGTZjM=
X-Received: by 2002:a05:651c:30ec:b0:38c:33d1:dd09 with SMTP id
 38308e7fff4ca-38c653f91c1mr24155731fa.10.1774701616378; Sat, 28 Mar 2026
 05:40:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260121-a733-rtc-v1-0-d359437f23a7@pigmoral.tech> <20260121-a733-rtc-v1-6-d359437f23a7@pigmoral.tech>
In-Reply-To: <20260121-a733-rtc-v1-6-d359437f23a7@pigmoral.tech>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Sat, 28 Mar 2026 20:40:04 +0800
X-Gmail-Original-Message-ID: <CAGb2v66YWa_CnSh1_rM707Lne4MF+imML3B5ad4TQ34hZgQ-tQ@mail.gmail.com>
X-Gm-Features: AQROBzD9uvYPfehFAvfWSqRC7-wZ99UgUGl_PBhFagiwx6384R3sEI_1rOb_K7w
Message-ID: <CAGb2v66YWa_CnSh1_rM707Lne4MF+imML3B5ad4TQ34hZgQ-tQ@mail.gmail.com>
Subject: Re: [PATCH 6/7] rtc: sun6i: Add support for A733 RTC
To: Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Ripard <mripard@kernel.org>, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6258-lists,linux-rtc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[baylibre.com,kernel.org,gmail.com,sholland.org,bootlin.com,vger.kernel.org,lists.infradead.org,lists.linux.dev];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wens@kernel.org,linux-rtc@vger.kernel.org];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-0.984];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	HAS_REPLYTO(0.00)[wens@kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pigmoral.tech:email,mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7572F34EF24
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Jan 21, 2026 at 7:04=E2=80=AFPM Junhui Liu <junhui.liu@pigmoral.tec=
h> wrote:
>
> The RTC in the Allwinner A733 SoC is compatible with the H616 in terms
> of its time storage and alarm functionality. However, its internal CCU
> is different, with additional DCXO handling logic.
>
> Add new match data to register a new auxiliary device for its CCU part.

This is probably incorrect, since you aren't actually adding auxiliary
devices. It should just say "add a new compatible and matching data for
the new SoC".

>
> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
> ---
>  drivers/rtc/rtc-sun6i.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/drivers/rtc/rtc-sun6i.c b/drivers/rtc/rtc-sun6i.c
> index b4489e0a09ce..a58d9c6b917c 100644
> --- a/drivers/rtc/rtc-sun6i.c
> +++ b/drivers/rtc/rtc-sun6i.c
> @@ -865,6 +865,11 @@ static const struct sun6i_rtc_match_data sun6i_rtc_m=
atch_data =3D {
>         .flags =3D RTC_LINEAR_DAY,
>  };
>
> +static const struct sun6i_rtc_match_data sun60i_rtc_match_data =3D {
> +       .adev_name =3D "sun60i",
> +       .flags =3D RTC_LINEAR_DAY,
> +};
> +
>  /*
>   * As far as RTC functionality goes, all models are the same. The
>   * datasheets claim that different models have different number of
> @@ -883,6 +888,8 @@ static const struct of_device_id sun6i_rtc_dt_ids[] =
=3D {
>                 .data =3D &sun6i_rtc_match_data },
>         { .compatible =3D "allwinner,sun50i-r329-rtc",
>                 .data =3D &sun6i_rtc_match_data },
> +       { .compatible =3D "allwinner,sun60i-a733-rtc",
> +               .data =3D &sun60i_rtc_match_data },
>         { /* sentinel */ },
>  };
>  MODULE_DEVICE_TABLE(of, sun6i_rtc_dt_ids);
>
> --
> 2.52.0
>
>

