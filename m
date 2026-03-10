Return-Path: <linux-rtc+bounces-6164-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iNklHlcFsGlAegIAu9opvQ
	(envelope-from <linux-rtc+bounces-6164-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Tue, 10 Mar 2026 12:49:43 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 118A124B9A8
	for <lists+linux-rtc@lfdr.de>; Tue, 10 Mar 2026 12:49:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 58E743015101
	for <lists+linux-rtc@lfdr.de>; Tue, 10 Mar 2026 11:48:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFA89389DEC;
	Tue, 10 Mar 2026 11:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="drUKp5gv"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A71AF36C580;
	Tue, 10 Mar 2026 11:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773143306; cv=none; b=B+mGjW1gjG0ICoMIKFoY1J9f0w1uQNzBlSCmmxx7FzN7XD0sFUmeYMYUqA91WjzMee+nnRDTFdVZFOuqCqx2ZGN/6MRzJz5loHP9J/NdXMxM9Wgyl3muN5dykiOyaDyvJ1iybpc/omS8w5Knyjf83FOzD6S4GGm7L/qnQQMsay0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773143306; c=relaxed/simple;
	bh=Jw1AY1K8BFMsal2DolsFjTPgtVzy1zFVvuxb6CRg0ic=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lK4OY+zNE7w5z9TFP2UcOfzZcuoEWkJum+oNGVmPz5muYdMlBit5t/MM5M3xN5Sn/smbA91nwqj5OqygtH4NHq1hEHdfVlHl3ESy4omylA0hkH1VLMt4aUNGSoFbawl4S74auaujJdREXjEYpZN4NO3b0lZV5zUH+r3FGVoO37U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=drUKp5gv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1B78C19423;
	Tue, 10 Mar 2026 11:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773143306;
	bh=Jw1AY1K8BFMsal2DolsFjTPgtVzy1zFVvuxb6CRg0ic=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=drUKp5gvDcHM19RZKc/JI6zt4irMrEHhGoN+jsboPIuOqJiCksIvNNwfeXkXPr/jj
	 La2tZIaup9uR6CX/MIKuavcDaayxZHkXrYdijqbmfB8cQORShoih28qKr8/fYJyNJv
	 Ergmf28yTaiWZqmIL74TXJcnXa3wMppoDCsyOMFuXyP6lVk4TeJW9G6c5qUhmMssbw
	 wlL/DpRPvWE0M0o8x/Zzsu9zOt1mZBG3RD1uQACN5qmAbJ2NCYmwH7fk1lUNxGf0JO
	 qtJe8ixu7eTeQaBU9u7n7XPJ5B/5lwvuRrZyWsJica2N30+EyOtAY9XhK0gm4hpfjK
	 43ovpvQU6+Oaw==
Date: Tue, 10 Mar 2026 11:48:18 +0000
From: Lee Jones <lee@kernel.org>
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
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
	Nam Tran <trannamatk@gmail.com>, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	linux-rtc@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v3 10/13] leds: rgb: add support for Samsung S2M series
 PMIC RGB LED device
Message-ID: <20260310114818.GH183676@google.com>
References: <20260225-s2mu005-pmic-v3-0-b4afee947603@disroot.org>
 <20260225-s2mu005-pmic-v3-10-b4afee947603@disroot.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260225-s2mu005-pmic-v3-10-b4afee947603@disroot.org>
X-Rspamd-Queue-Id: 118A124B9A8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6164-lists,linux-rtc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,samsung.com,linaro.org,bootlin.com,lwn.net,linuxfoundation.org,gmail.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-rtc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,disroot.org:email]
X-Rspamd-Action: no action

On Wed, 25 Feb 2026, Kaustabh Chakraborty wrote:

> Add support for the RGB LEDs found in certain Samsung S2M series PMICs.
> The device has three LED channels, controlled as a single device. These
> LEDs are typically used as status indicators in mobile phones.
> 
> The driver includes initial support for the S2MU005 PMIC RGB LEDs.
> 
> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> ---
>  drivers/leds/rgb/Kconfig        |  11 +
>  drivers/leds/rgb/Makefile       |   1 +
>  drivers/leds/rgb/leds-s2m-rgb.c | 458 ++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 470 insertions(+)

Start by applying all of the comments I made on the 'flash' device.

I'll take a more in-depth look at this one on the next version.

-- 
Lee Jones [李琼斯]

