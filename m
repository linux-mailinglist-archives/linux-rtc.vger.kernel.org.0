Return-Path: <linux-rtc+bounces-6898-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bB18DfHOSmqQHwEAu9opvQ
	(envelope-from <linux-rtc+bounces-6898-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Sun, 05 Jul 2026 23:38:57 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9097C70B7F1
	for <lists+linux-rtc@lfdr.de>; Sun, 05 Jul 2026 23:38:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bootlin.com header.s=dkim header.b=f1C3e1rN;
	dmarc=pass (policy=reject) header.from=bootlin.com;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6898-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6898-lists+linux-rtc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 932A030087A3
	for <lists+linux-rtc@lfdr.de>; Sun,  5 Jul 2026 21:38:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A82B370D6E;
	Sun,  5 Jul 2026 21:38:34 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D90A12F7EFF
	for <linux-rtc@vger.kernel.org>; Sun,  5 Jul 2026 21:38:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783287514; cv=none; b=EofigHMWpXpAkdwrBX7JKCc8fYNw3fnlZ4DZIW/Ms5BS0QHPJIYygM2tQDfnICyg9sGI06LssjKyfw/IRKwnwAxd6MEQnhPuHJdZOQPPgTEU4nOv8N34IJK8Vc1oFldP24EDItsE0NnMhJjT9RgZgza6Un+iR60oSfCkQnojp98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783287514; c=relaxed/simple;
	bh=AudKt1V8+KDEu+V2vDgxJisT/saSektGt1MIpi1jEBg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SXVMWLX+jU2nK0PVPl+uf+4MCFMDiCZPcTlPYYdPiKOoM/hap+Yi6y5tnooNDSvGT79o828kW1CZSS84B3/8u8nb5qIY5IqOwnCz8lwbsuclXOGoywMkqh6vyXFZ8u94H92WyEI0y5kbVITLuKIAlap7ATzevIyZXR9EK988Kzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=f1C3e1rN; arc=none smtp.client-ip=185.171.202.116
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 08F8DC8EC43;
	Sun,  5 Jul 2026 21:38:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 35EB0601A2;
	Sun,  5 Jul 2026 21:38:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 568AF11BB95F0;
	Sun,  5 Jul 2026 23:38:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783287510; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=Y1UXtT8BmOoe/s7y9k9MbPlbWZSkBpQj1qefN9muTjc=;
	b=f1C3e1rNwou+Okt6VZ8A38DgopxU0B2JHBR8wohTm2+ApRM9tmAnvP+BNoCh8yQeySo1Nj
	E6fCAYJ7JhR2CYLH/IyvaGs/RzFCzaSfyDYkkMhKjy/w3VyAuVQ+ylvTL1Z3nKmTP+TzF4
	qGA4X61SG1NCHMBbRQs80q/WKHO8l6RheElkrckh2+SvlFJCOQv1O0T9JrxXgjNDQ7G/Dd
	kAqulb+mG90oXfQdlJazkq6pSjj+iElLLCqg1nCcItjF0CsBhUAU6lTBFLQYrCWjrKV/XM
	S4L/rWssIMrEblxnfGpiwc36B20dxvOs1MSDC0vtxv/RY9b+r2C7M1jYdODFuw==
Date: Sun, 5 Jul 2026 23:38:27 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Junhui Liu <junhui.liu@pigmoral.tech>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>,
	linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v3 2/8] dt-bindings: rtc: sun6i: add sun60i-a733 support
Message-ID: <202607052138277aa6b793@mail.local>
References: <20260702-a733-rtc-v3-0-eb2580374de6@baylibre.com>
 <20260702-a733-rtc-v3-2-eb2580374de6@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260702-a733-rtc-v3-2-eb2580374de6@baylibre.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6898-lists,linux-rtc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbrunet@baylibre.com,m:junhui.liu@pigmoral.tech,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:wens@kernel.org,m:jernej.skrabec@gmail.com,m:samuel@sholland.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:mripard@kernel.org,m:linux-rtc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-sunxi@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:linux-clk@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[alexandre.belloni@bootlin.com,linux-rtc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_CC(0.00)[pigmoral.tech,kernel.org,gmail.com,sholland.org,baylibre.com,vger.kernel.org,lists.infradead.org,lists.linux.dev];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexandre.belloni@bootlin.com,linux-rtc@vger.kernel.org];
	DKIM_TRACE(0.00)[bootlin.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,bootlin.com:from_mime,bootlin.com:email,bootlin.com:url,bootlin.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.local:mid,baylibre.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9097C70B7F1

On 02/07/2026 10:10:01+0200, Jerome Brunet wrote:
> Add a new rtc compatible for the sun60i-a733 SoC and new IDs for the
> peripheral oscillator clock gates of this SoC.
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

> ---
>  Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml | 1 +
>  include/dt-bindings/clock/sun6i-rtc.h                              | 4 ++++
>  2 files changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml b/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
> index 959a012c626f..f2b91186ed37 100644
> --- a/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
> +++ b/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
> @@ -33,6 +33,7 @@ properties:
>            - enum:
>                - allwinner,sun20i-d1-rtc
>                - allwinner,sun55i-a523-rtc
> +              - allwinner,sun60i-a733-rtc
>            - const: allwinner,sun50i-r329-rtc
>  
>    reg:
> diff --git a/include/dt-bindings/clock/sun6i-rtc.h b/include/dt-bindings/clock/sun6i-rtc.h
> index 3bd3aa3d57ce..5132a393ca4b 100644
> --- a/include/dt-bindings/clock/sun6i-rtc.h
> +++ b/include/dt-bindings/clock/sun6i-rtc.h
> @@ -6,5 +6,9 @@
>  #define CLK_OSC32K		0
>  #define CLK_OSC32K_FANOUT	1
>  #define CLK_IOSC		2
> +#define CLK_HOSC_UFS		8
> +#define CLK_HOSC_HDMI		9
> +#define CLK_HOSC_SERDES0	10
> +#define CLK_HOSC_SERDES1	11
>  
>  #endif /* _DT_BINDINGS_CLK_SUN6I_RTC_H_ */
> 
> -- 
> 2.47.3
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

