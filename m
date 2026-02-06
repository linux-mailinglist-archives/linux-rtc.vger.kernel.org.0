Return-Path: <linux-rtc+bounces-5947-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SPIpAHDthWlvIQQAu9opvQ
	(envelope-from <linux-rtc+bounces-5947-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Fri, 06 Feb 2026 14:32:32 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AA277FE25E
	for <lists+linux-rtc@lfdr.de>; Fri, 06 Feb 2026 14:32:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1D79B3020EC9
	for <lists+linux-rtc@lfdr.de>; Fri,  6 Feb 2026 13:32:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3FD13B8D65;
	Fri,  6 Feb 2026 13:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FjQQ1YIG"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A4E938FA3;
	Fri,  6 Feb 2026 13:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770384718; cv=none; b=rOpsYj1IEUztyl1vwZ9sZ7XLZnywQxF/wgcfT3Ut87vozMsb+gt8TmvUhjSmnCOf71mW+jqzQ+fE9w/fgCd/Gcbv0+tgaWgDR2+qeYYMmUdA0OTc8j6bDZsm4tVKBukIba6nGnKiAYf81SjaB3+CtK5UfL2OQGDdIxCjqhuFo/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770384718; c=relaxed/simple;
	bh=v8CodHgF9zNyn1am7FQ4QRln8vrKuSpEBZmyeMLwtLA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uI4ANuZJzLrbyTKq4l6Jl/LwsP3rXc+ln36Z030Xt/RNctiayLsRtAIsyf7SjtiUh6+aHV9fYZLIV5Telsu0P940r4vcZ0OniWeSwRkElQtkEKYLxxCJ5zhOJnno5E8ADpFoTdY/rSfuTJlrFFQLyTTxjCi5WG4kZzyz1RzB5ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FjQQ1YIG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF94AC116C6;
	Fri,  6 Feb 2026 13:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770384718;
	bh=v8CodHgF9zNyn1am7FQ4QRln8vrKuSpEBZmyeMLwtLA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FjQQ1YIGbraZkUPGUn1+wyq1kntSlLeYMlikbYGTb9pKDjtdKIXcGtdH9MiFd4GR8
	 fsMQ8cmnZ7oDQld766YqlZNHKAxE/IS4Nueybd7qyUBLyYLz8S1YNuw0PoeS63THAJ
	 BUh9h3pRSiGdoQAxfHy/xg2HeYTEpNnWq5YMq1dlcODMdlPDovbkgbvZ23PBSB0/Pw
	 O+/wU0y9ZuOuiqgkC7K1ThJpkkby5BR3eoung9+eQGSUFTlPVjE4RrhJLpk3KmXXkf
	 5lI8p9gOOTRV5rBTW4jf3z/tFO7OZQ1fVmxL31bGLV45Eor+3fb4vjkB0bl0785Mp+
	 w5cLCEbOXztBw==
Date: Fri, 6 Feb 2026 07:31:57 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: devicetree@vger.kernel.org, linux-rtc@vger.kernel.org,
	Lee Jones <lee@kernel.org>, Andy Shevchenko <andy@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-input@vger.kernel.org, Tony Lindgren <tony@atomide.com>,
	Dixit Parmar <dixitparmar19@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>, linux-leds@vger.kernel.org,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-iio@vger.kernel.org,
	David Lechner <dlechner@baylibre.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 03/10] dt-bindings: iio: adc: cpcap-adc: document Mot
 ADC
Message-ID: <177038471641.154307.7773046855985679621.robh@kernel.org>
References: <20260125134302.45958-1-clamor95@gmail.com>
 <20260125134302.45958-4-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260125134302.45958-4-clamor95@gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-5947-lists,linux-rtc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[21];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,bootlin.com,atomide.com,gmail.com,analog.com,baylibre.com];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-rtc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: AA277FE25E
X-Rspamd-Action: no action


On Sun, 25 Jan 2026 15:42:55 +0200, Svyatoslav Ryhel wrote:
> Add compatible for ADC used in Mot board. Separate compatible is required
> since ADC in the Mot board uses a unique set of configurations.
> 
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  .../devicetree/bindings/iio/adc/motorola,cpcap-adc.yaml          | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


