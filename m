Return-Path: <linux-rtc+bounces-6630-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hajCIAYzH2p1igAAu9opvQ
	(envelope-from <linux-rtc+bounces-6630-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Tue, 02 Jun 2026 21:46:14 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BFBA631808
	for <lists+linux-rtc@lfdr.de>; Tue, 02 Jun 2026 21:46:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=ftskL0vw;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6630-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6630-lists+linux-rtc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 93C5B3006172
	for <lists+linux-rtc@lfdr.de>; Tue,  2 Jun 2026 19:46:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 151E42C08DC;
	Tue,  2 Jun 2026 19:46:10 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29024183CC3;
	Tue,  2 Jun 2026 19:46:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780429569; cv=none; b=UnJ9Kzyi8FvomiaF6y7jVgzGxZcSr67lVWzH1FwTd5Rn9XPU7YU0mnWXZJdQlm+9PU0jM5m94qaSW1wdHOo5M+TZ0xT5KqRaD/vL8wygS+vKFWVng/Md5uC30kPZx3VPaBWcPaR5chPB5z3IA400bg2ha/R925U1SwZl1ji4C+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780429569; c=relaxed/simple;
	bh=z3qmunTjQCTFibnWGcF0LuJ4zhe83D3cuLD+x/yWAlw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NAsda8coTFgla9T0liUMD7lQdE9KtFSQKqElJOugdoT8homgu2j4fHd/H0JVMiIqcaywwjQkQwcfKD7hWv1CHZa0pIlSTeHOwrcJyyv1jE3g7kDfrK20Vkxx2IRRc3g33rYMJgobgJ6Zy6TfB3Yi2snLCiJPkd4oGV4amoScntk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ftskL0vw; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9415A1F00893;
	Tue,  2 Jun 2026 19:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780429566;
	bh=FK+MzLh50k4KgIQIJX2KAuivt6XGuoiQBPlt2hCLlsw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ftskL0vwH9XUbViZ3GXIeCx3ef2akjJZ/roPPniGDZUzamobfFZmVCE/e65438GjC
	 LsYfUf5sJSl+D+LD4ICxhjim03UQ5NKIHgZzeQlxyebeP1vHc7860uz+r7Z1Toy0rN
	 IqGKOX1BfjIDkArZOmYbS75KyXcQSFaZFHxqkmxuiZ8XoWZcUn5CCbE7z1VjmKZYqV
	 +K50W9uJaA1sW3viTYurNanm+1iSbzxVMY/uUgG2Z4aJdBsu7gAnYjp/Ox5SBe1fGO
	 Ro6eq6xwr3o7xOapAqvsfnLMYY+cFTRma/FPPbA7FA0ADa5BF+f0ewS8sqvdSRBxHu
	 KTt0toQdM85iQ==
Date: Tue, 2 Jun 2026 14:46:06 -0500
From: Rob Herring <robh@kernel.org>
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	MyungJoo Ham <myungjoo.ham@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Sebastian Reichel <sre@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Nam Tran <trannamatk@gmail.com>,
	=?utf-8?B?xYF1a2FzeiBMZWJpZWR6acWEc2tp?= <kernel@lvkasz.us>,
	Yassine Oudjana <y.oudjana@protonmail.com>,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org, linux-rtc@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v7 02/10] dt-bindings: extcon: document Samsung S2M
 series PMIC extcon device
Message-ID: <20260602194606.GA1043828-robh@kernel.org>
References: <20260516-s2mu005-pmic-v7-0-73f9702fb461@disroot.org>
 <20260516-s2mu005-pmic-v7-2-73f9702fb461@disroot.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260516-s2mu005-pmic-v7-2-73f9702fb461@disroot.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6630-lists,linux-rtc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[robh@kernel.org,linux-rtc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[25];
	FORGED_RECIPIENTS(0.00)[m:kauschluss@disroot.org,m:lee@kernel.org,m:pavel@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:myungjoo.ham@samsung.com,m:cw00.choi@samsung.com,m:sre@kernel.org,m:krzk@kernel.org,m:andre.draszik@linaro.org,m:alexandre.belloni@bootlin.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:trannamatk@gmail.com,m:kernel@lvkasz.us,m:y.oudjana@protonmail.com,m:linux-leds@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-samsung-soc@vger.kernel.org,m:linux-rtc@vger.kernel.org,m:linux-doc@vger.kernel.org,m:conor.dooley@microchip.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,samsung.com,linaro.org,bootlin.com,lwn.net,linuxfoundation.org,gmail.com,lvkasz.us,protonmail.com,vger.kernel.org,microchip.com,oss.qualcomm.com];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-rtc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5BFBA631808

On Sat, May 16, 2026 at 03:08:34AM +0530, Kaustabh Chakraborty wrote:
> Certain Samsung S2M series PMICs have a MUIC device which reports
> various cable states by measuring the ID-GND resistance with an internal
> ADC. Document the devicetree schema for this device.
> 
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> ---
>  .../bindings/extcon/samsung,s2mu005-muic.yaml      | 40 ++++++++++++++++++++++
>  1 file changed, 40 insertions(+)

As the rest of the series was applied without this, I've applied it to 
fix errors in dt_binding_check.

Rob

