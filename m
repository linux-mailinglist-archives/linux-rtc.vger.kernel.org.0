Return-Path: <linux-rtc+bounces-6644-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MxGqIyqDLGrTRwQAu9opvQ
	(envelope-from <linux-rtc+bounces-6644-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Sat, 13 Jun 2026 00:07:38 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 32C9E67CA8D
	for <lists+linux-rtc@lfdr.de>; Sat, 13 Jun 2026 00:07:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=eSeH4214;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6644-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6644-lists+linux-rtc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2AFA030DBE5F
	for <lists+linux-rtc@lfdr.de>; Fri, 12 Jun 2026 22:07:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C009639A815;
	Fri, 12 Jun 2026 22:07:23 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B067B389108;
	Fri, 12 Jun 2026 22:07:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781302043; cv=none; b=Pr9TfUSfV4wvyzjHmOJHm4DQLqXlaKwlGQXRvZG2cXF4v3LhNjYlHcTmvpZ8XHUc9FZiMbgzu7XffKwoNREtUtsb9fwg5Syv0ifIPHacnT6pPbFQnjKVD252O8nbAIxV9CndDtXSmogrQ5m0avRFOcyy2dQZDlly2qub7S3NCBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781302043; c=relaxed/simple;
	bh=kal8MWWC+s3/wQwF8S90+qoOyh5nANqkBNfU/7+MzhM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QqCRd+gSN7EJkO1nNK/06IqwQe+Pf4EJu0oMzk3R1C2avPvRA/+IcYeASissnIs/19KWog2jeQGcVNY0R1BPxYzCQDSip33xcMwBvMhCj6sk7su2NlWY0iq8f+YDzRnKYl4SNK4/lsFPZCpDpuTYlBq3HB+lmru5aCsDcODOFso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eSeH4214; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A1701F000E9;
	Fri, 12 Jun 2026 22:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781302042;
	bh=IN3NFdrc14uXt12CxYGdLvKSeFnCWmr06lwae8sC5PQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eSeH42147TIqEamoqMGijR7mxIS4V3VFsHwhimWdPwNNtSUKeyvlWgLd8MS9WZAAH
	 /GU8SoIi0KbUr1+vjmG1SphztmEQwL75hCu2Eb399lVwUaPOSj6IsrDX6RzaSPlAGw
	 iRNDVY7mR1Mo2yjBAnV5aaLOKMG5zP4KLHJHO9qjPDk/pX4dmWhfSuqLiR+mOf/lt/
	 zg31BRI2ixfhkVcxPOECcak+LgDtoHUlyWQVCfU5gtiGa/9ickcR4bJ+TjD1nwN9ax
	 kklPeAovejBrzj7S0qSalz76zg10S42g4ZHMnqqXLeIXn9gOTWLo3xoLozQQHA4ice
	 rwcQE8V7io5dw==
Date: Fri, 12 Jun 2026 17:07:21 -0500
From: Rob Herring <robh@kernel.org>
To: James Calligeros <jcalligeros99@gmail.com>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Neal Gompa <neal@gompa.dev>, Lee Jones <lee@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-input@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v6 1/7] dt-bindings: hwmon: Add Apple System Management
 Controller hwmon schema
Message-ID: <20260612220721.GA1901304-robh@kernel.org>
References: <20251215-macsmc-subdevs-v6-0-0518cb5f28ae@gmail.com>
 <20251215-macsmc-subdevs-v6-1-0518cb5f28ae@gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251215-macsmc-subdevs-v6-1-0518cb5f28ae@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6644-lists,linux-rtc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:jcalligeros99@gmail.com,m:sven@kernel.org,m:j@jannau.net,m:alyssa@rosenzweig.io,m:neal@gompa.dev,m:lee@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:alexandre.belloni@bootlin.com,m:jdelvare@suse.com,m:linux@roeck-us.net,m:dmitry.torokhov@gmail.com,m:corbet@lwn.net,m:asahi@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-rtc@vger.kernel.org,m:linux-hwmon@vger.kernel.org,m:linux-input@vger.kernel.org,m:linux-doc@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:dmitrytorokhov@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[robh@kernel.org,linux-rtc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-rtc@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,jannau.net,rosenzweig.io,gompa.dev,bootlin.com,suse.com,roeck-us.net,gmail.com,lwn.net,lists.linux.dev,lists.infradead.org,vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,gompa.dev:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 32C9E67CA8D

On Mon, Dec 15, 2025 at 07:37:45PM +1000, James Calligeros wrote:
> Apple Silicon devices integrate a vast array of sensors, monitoring
> current, power, temperature, and voltage across almost every part of
> the system. The sensors themselves are all connected to the System
> Management Controller (SMC). The SMC firmware exposes the data
> reported by these sensors via its standard FourCC-based key-value
> API. The SMC is also responsible for monitoring and controlling any
> fans connected to the system, exposing them in the same way.
> 
> For reasons known only to Apple, each device exposes its sensors with
> an almost totally unique set of keys. This is true even for devices
> which share an SoC. An M1 Mac mini, for example, will report its core
> temperatures on different keys to an M1 MacBook Pro. Worse still, the
> SMC does not provide a way to enumerate the available keys at runtime,
> nor do the keys follow any sort of reasonable or consistent naming
> rules that could be used to deduce their purpose. We must therefore
> know which keys are present on any given device, and which function
> they serve, ahead of time.
> 
> Add a schema so that we can describe the available sensors for a given
> Apple Silicon device in the Devicetree.
> 
> Reviewed-by: Neal Gompa <neal@gompa.dev>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
> ---
>  .../bindings/hwmon/apple,smc-hwmon.yaml  | 86 +++++++++++++++++++++++++
>  .../bindings/mfd/apple,smc.yaml          | 36 +++++++++++
>  MAINTAINERS                              |  1 +
>  3 files changed, 123 insertions(+)

I fixed up the error and applied. Please ensure all your patches get 
applied.

Rob

