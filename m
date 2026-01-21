Return-Path: <linux-rtc+bounces-5823-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eL3kK50fcWmodQAAu9opvQ
	(envelope-from <linux-rtc+bounces-5823-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Wed, 21 Jan 2026 19:49:01 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 18C6B5B83A
	for <lists+linux-rtc@lfdr.de>; Wed, 21 Jan 2026 19:49:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8CE14A683F6
	for <lists+linux-rtc@lfdr.de>; Wed, 21 Jan 2026 17:09:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA9933A7F5A;
	Wed, 21 Jan 2026 16:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XFk3fnG7"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96CBD378D6D;
	Wed, 21 Jan 2026 16:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769014594; cv=none; b=KHbIiro6q3bjzAUjH0DPfeZZfpBvjQJGgDXM291oSIdX1Ldfz94eCDn+iJqK0e8W6lfUA0Z6TCB2Ec98P3dN/nPADjR5ySVSuE80UEtuB2ldepGiylUNVVyPOPamj69liLkB2icjkC5WEiySiZBNsnfLoHyF0tkEV0m5DtZtNFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769014594; c=relaxed/simple;
	bh=z6ncdW1tF9rL0/zlvdL9Ux7pYtvgWh2A0N0+vyjHyGA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aeTAwaoLwyhthbV7hDrBLwxky3jidzc/rQvavHTgNoav+wxacaPUVKdTtEW0av3HxN6RA8ALAIe19EzkDOO0QzdEmgrPHmfkBxgYHOT9Hb2jJE8tfZj+cbLiGexIJO1bD3XSh5wt5/BGixR6/XCvlki0S7t1fahfnmrlRnCdA1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XFk3fnG7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18D08C4CEF1;
	Wed, 21 Jan 2026 16:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769014594;
	bh=z6ncdW1tF9rL0/zlvdL9Ux7pYtvgWh2A0N0+vyjHyGA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XFk3fnG7osBlyl3ml764DVFHhbwUZIABeT1VrstE1l2ROLa/nx2XDArVU1Zd+7+FD
	 uW5E3IZZ+1AgpfP24oQ9ooG5pqzuIIryO1KtY3tVj00ogJpBAnQ27N3EVuU0ovDb8t
	 3WDc8LLi1gJqg4yZqJSG2aSBsTOYX+ktPd6j81UgjbUf28fyxhx+osy15jmWrCq4EQ
	 uzoA6kLYsi2cm6U0V8c8FgT4DtJZCyeszqcXrjyUJ2DCeOK0Z7drctfitn2CvOE+NM
	 /6BFxL7TB1j4At/HQrJoAKH550exBh4mzA/Yp1nmMIgVPDk+j8/XaMz3wIBVE5ZQyn
	 N5eCElyvjp6hA==
Date: Wed, 21 Jan 2026 10:56:33 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>, devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	Samuel Holland <samuel@sholland.org>,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 1/7] dt-bindings: rtc: sun6i: Add Allwinner A733 support
Message-ID: <176901459264.3452980.894788621483141855.robh@kernel.org>
References: <20260121-a733-rtc-v1-0-d359437f23a7@pigmoral.tech>
 <20260121-a733-rtc-v1-1-d359437f23a7@pigmoral.tech>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260121-a733-rtc-v1-1-d359437f23a7@pigmoral.tech>
X-Spamd-Result: default: False [0.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-5823-lists,linux-rtc=lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,bootlin.com,vger.kernel.org,kernel.org,sholland.org,lists.infradead.org,baylibre.com,lists.linux.dev];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-rtc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 18C6B5B83A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Wed, 21 Jan 2026 18:59:07 +0800, Junhui Liu wrote:
> The RTC module in the Allwinner A733 SoC is functionally compatible with
> the sun6i RTC, but its internal Clock Control Unit (CCU) has significant
> changes.
> 
> The A733 supports selecting the oscillator between three frequencies:
> 19.2MHz, 24MHz, and 26MHz. The RTC CCU relies on hardware to detect
> which frequency is actually used on the board. By defining all three
> frequencies as fixed-clocks in the device tree, the driver can identify
> the hardware-detected frequency and expose it to the rest of the system.
> 
> Additionally, the A733 RTC CCU provides several new DCXO gate clocks for
> specific modules, including SerDes, HDMI, and UFS.
> 
> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
> ---
>  .../bindings/rtc/allwinner,sun6i-a31-rtc.yaml      | 38 ++++++++++++++++++++--
>  include/dt-bindings/clock/sun60i-a733-rtc.h        | 16 +++++++++
>  2 files changed, 52 insertions(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


