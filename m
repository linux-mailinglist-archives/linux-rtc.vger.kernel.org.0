Return-Path: <linux-rtc+bounces-6345-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id M9RmJOOd4GlhkQAAu9opvQ
	(envelope-from <linux-rtc+bounces-6345-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Thu, 16 Apr 2026 10:29:23 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E14B40B8C7
	for <lists+linux-rtc@lfdr.de>; Thu, 16 Apr 2026 10:29:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 389AD31170EC
	for <lists+linux-rtc@lfdr.de>; Thu, 16 Apr 2026 08:23:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D3293914FF;
	Thu, 16 Apr 2026 08:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VfWJyWSN"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E707221D3E2;
	Thu, 16 Apr 2026 08:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776327807; cv=none; b=bv4S7zbaH5ypoiZUQzzGBy9rvGJ3UebUq4qi+j1EYnc7P1RiKDz0mdHFmSvzbAqkciNAmHraj8x47aURmwHieJOoDg2CI7T7G07ZijJi0xgsuNPq0FhlEZss62aPArQfEuLEUJK/AZVWpaAaShLsy6TfbBINCGR1RWxyZbQRYQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776327807; c=relaxed/simple;
	bh=7iqdeBf056Y8f773kiB5jg4IskAEOD5AHTuM5uEHn9w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LdhVPk+4nwDaxl2czFIgLL97r/4zUjXI1ADApEOy8/4LuXpnRdWTCxIe6LbzRurP/LlP25Hh+MoDza/znZ68JR7RhCxId/n89vVWpTQspbY1aLBnxzutU7Z9x8MwrF8iZ5BPZwikmcLl3m6Lr9Qo0ExNnNYlUCvAFcfUUfvZg78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VfWJyWSN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C5CAC2BCAF;
	Thu, 16 Apr 2026 08:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776327806;
	bh=7iqdeBf056Y8f773kiB5jg4IskAEOD5AHTuM5uEHn9w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VfWJyWSNLcRI3mHfjJQ//U3Em9KSyrdWYhU9QmMbY93UEIe7NQtMni3n85pAdojFt
	 Soq7/+JoRXmAAK/c2mUOIjouhPNidagBWaPcym9cn69N0Q61LLoOdn4NIgs4lZgqdy
	 xkoZZZqOjFGIKFB8W5DXO/svEiuTwOPSU2kYMUnSdjHz3RCdcncuqN2Relso/0QZzH
	 94Y1oCK73QW3YlVFO+Dn4083Igd0QGR80mGvNz69wUa+fG+h4NZaL+3oWqMJV0wyV/
	 yNV85tEgdeDHmdxuIkmolxk3yRrj8CHa9JJ0TMlk5sVFM39VW8Vjj5G9xrVwTm0Qov
	 XD42AdN5JOGQw==
Date: Thu, 16 Apr 2026 10:23:24 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, MyungJoo Ham <myungjoo.ham@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Sebastian Reichel <sre@kernel.org>, 
	=?utf-8?B?QW5kcsOp?= Draszik <andre.draszik@linaro.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Nam Tran <trannamatk@gmail.com>, =?utf-8?B?xYF1a2FzeiBMZWJpZWR6acWEc2tp?= <kernel@lvkasz.us>, 
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-rtc@vger.kernel.org, 
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v4 02/13] dt-bindings: leds: document Samsung S2M series
 PMIC RGB LED device
Message-ID: <20260416-upbeat-archetypal-mantis-1ede48@quoll>
References: <20260414-s2mu005-pmic-v4-0-7fe7480577e6@disroot.org>
 <20260414-s2mu005-pmic-v4-2-7fe7480577e6@disroot.org>
 <20260415-sensible-kiwi-of-argument-44d6ed@quoll>
 <DHTWNPSQ06IJ.24A9E1FL1RWER@disroot.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <DHTWNPSQ06IJ.24A9E1FL1RWER@disroot.org>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ASN_FAIL(0.00)[1.2.3.5.c.f.2.1.0.0.0.0.0.0.0.0.b.d.0.0.1.0.0.e.a.0.c.3.0.0.6.2.asn6.rspamd.com:server fail];
	RCPT_COUNT_TWELVE(0.00)[22];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-6345-lists,linux-rtc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-rtc@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,samsung.com,linaro.org,bootlin.com,lwn.net,linuxfoundation.org,gmail.com,lvkasz.us,vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3E14B40B8C7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 15, 2026 at 11:00:16PM +0530, Kaustabh Chakraborty wrote:
> On 2026-04-15 09:03 +02:00, Krzysztof Kozlowski wrote:
> > On Tue, Apr 14, 2026 at 12:02:54PM +0530, Kaustabh Chakraborty wrote:
> >> +description: |
> >> +  The Samsung S2M series PMIC RGB LED is a three-channel LED device with
> >> +  8-bit brightness control for each channel, typically used as status
> >> +  indicators in mobile phones.
> >> +
> >> +  This is a part of device tree bindings for S2M and S5M family of Power
> >> +  Management IC (PMIC).
> >> +
> >> +  See also Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml for
> >> +  additional information and example.
> >> +
> >> +allOf:
> >> +  - $ref: common.yaml#
> >
> > Rob's comment is still valid:
> > 1. How do you address one of three LEDs in non-RGB case?
> > 2. Where is multi-color?
> 
> Yes, multi-color should have been added here.
> 
> >
> > And based on this alone without other properties, I say this should be
> > part of top-level schema.  Separate node is fine, but no need for
> > separate binding.
> 
> BTW, for loading the sub-device driver via platform (as it won't be a
> separate binding) the driver *must* be built-in. Although not related to
> bindings, this seems counter-intuitive. I see the same problem with the

I don't understand that comment. If it has nothing to do with the
binding, what is the problem?

Best regards,
Krzysztof


