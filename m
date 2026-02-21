Return-Path: <linux-rtc+bounces-5993-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id u+pjDBOUmWnRVAMAu9opvQ
	(envelope-from <linux-rtc+bounces-5993-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Sat, 21 Feb 2026 12:16:35 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C51F16CBE8
	for <lists+linux-rtc@lfdr.de>; Sat, 21 Feb 2026 12:16:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BEE30300ECA4
	for <lists+linux-rtc@lfdr.de>; Sat, 21 Feb 2026 11:16:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25BCF331A45;
	Sat, 21 Feb 2026 11:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="uXDh2oGa"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BA432EB874
	for <linux-rtc@vger.kernel.org>; Sat, 21 Feb 2026 11:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771672590; cv=none; b=bkiH4ya4BqJQDuP0v2YQEqZK1DjlhU2d0Cn0v4uVKsyJMdXHhR8nto3+SaIepV+F7aklQTLb/7kZCXD8vymAIUHaAe8NgYf7cZ3+H6KSzjgd3pMx+uGMyKA5VuHxLWeRyEr9YlqutX+gOFX77eVM6JoIHjy9B91trFDceaQqvkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771672590; c=relaxed/simple;
	bh=FFjCbPajVgQyQIH3uD+TLNBIShPQKKdP9vxifaWsqx8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FUbB8txg4xtFU++SukRe4p8CrlDJ2uneiCkrWX95JhHLGb7P7cjxRTNQMEf9Mvg6NwhTA6jB41k5JSo6On58C3pR9dn9XSAyHOA1p74D2EGrJ7j6dE7iu8VVqTy10pbagCdlqHz/8jGhtO/+4MGUhpelGMzcm/pR1FR1/lVwNHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=uXDh2oGa; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id D42171A0D58;
	Sat, 21 Feb 2026 11:16:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A19AB5FB54;
	Sat, 21 Feb 2026 11:16:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 997C610368CDB;
	Sat, 21 Feb 2026 12:16:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1771672584; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=P51QtEh+tnGFDoHploYqX6JvzYjRSCbcSzVgY/4YCus=;
	b=uXDh2oGadUsFUTcjTtYH8bS427YQf2oVOH1MqRDvSr7Wey85VTpS700/oW5bYhI1Hn1NKB
	TOth9YFqxrlZKEsJezOqR1SI+GzS6JzFYUp8Ch0YV3gcT2Ml9yy6ydNthaTyTAvhWHNAtE
	23/x/ChGGidkwZMdmkrZcSF8oawK+ERTZ5PkBctWhM1+jxNkP+KTm+RTVoOvbgdIT8ZNCf
	O8OT+b87FrepzOktI//UeXqeN+MCNoNHCaU6gntrgZmvno/8lGtHB2uHF7BUTcgfu0iQcY
	bd6tH43gkQDIA4AxcapWCTwhIVp3cVY+GzOg7ckc2KR3rjEzdYMf+36sANrwSA==
Date: Sat, 21 Feb 2026 12:16:19 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Alvin Sun <alvin.sun@linux.dev>
Cc: Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	linux-rtc@vger.kernel.org, rust-for-linux@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>
Subject: Re: [RFC PATCH v3 1/5] rtc: add device selector for rtc_class_ops
 callbacks
Message-ID: <20260221111619162a41a1@mail.local>
References: <20260116162203.296844-1-sunke@kylinos.cn>
 <20260116162203.296844-2-sunke@kylinos.cn>
 <DFSN0O9RRVD6.1LCI38JKGO1R0@kernel.org>
 <77d373dc-c5f2-4dca-b0d2-b5cee6a21b3b@gmail.com>
 <20260220225341c5eeb835@mail.local>
 <d1c9e33b-e1f3-41c6-af5e-a85fe2b86d10@linux.dev>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d1c9e33b-e1f3-41c6-af5e-a85fe2b86d10@linux.dev>
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-5993-lists,linux-rtc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,garyguo.net,protonmail.com,google.com,umich.edu,vger.kernel.org,linuxfoundation.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexandre.belloni@bootlin.com,linux-rtc@vger.kernel.org];
	DKIM_TRACE(0.00)[bootlin.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[i2c.rs:url]
X-Rspamd-Queue-Id: 7C51F16CBE8
X-Rspamd-Action: no action

On 21/02/2026 17:31:09+0800, Alvin Sun wrote:
> As in platform.rs [1] and i2c.rs [2], set_drvdata is always called by
> the bus Adapter's probe_callback, not by the device driver.
> 
> [1]:
> https://elixir.bootlin.com/linux/v6.19-rc5/source/rust/kernel/platform.rs#L80
> [2]:
> https://elixir.bootlin.com/linux/v6.19-rc5/source/rust/kernel/i2c.rs#L160
> 
> In Rust the Adapter already sets drvdata on the bus device in probe. If
> the driver also calls amba_set_drvdata() there, it overwrites that
> pointer; on remove/shutdown the framework then gets wrong data and can
> hit use-after-free or crashes. So only the framework must set drvdata
> on the bus device.

But this is wrong, how do you then handle the class device on
suspend/resume or on .remove?

> 
> This applies only to the Rust implementation; in C, calling
> amba_set_drvdata() is fine. In the Rust design the bus device owns the
> bus device's drvdata and the class device owns the class device's
> drvdata, so the class driver must not set drvdata on the bus device.
> 
> This is my understanding of the Rust device driver abstraction design.
> Danilo is the authority on this.
> 
> Best regards,
> Ke Sun
> 
> > Out of 29 drivers, 18 are doing so.
> > 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

