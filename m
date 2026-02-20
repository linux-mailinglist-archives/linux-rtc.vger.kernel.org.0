Return-Path: <linux-rtc+bounces-5989-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 3QaEHwfmmGkYOAMAu9opvQ
	(envelope-from <linux-rtc+bounces-5989-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Fri, 20 Feb 2026 23:53:59 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D7F1616B550
	for <lists+linux-rtc@lfdr.de>; Fri, 20 Feb 2026 23:53:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 811A9301C6E5
	for <lists+linux-rtc@lfdr.de>; Fri, 20 Feb 2026 22:53:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CB552F83B5;
	Fri, 20 Feb 2026 22:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="wJwKI2uN"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D18119DF8D
	for <linux-rtc@vger.kernel.org>; Fri, 20 Feb 2026 22:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771628033; cv=none; b=uZy7e2OvNkOeQYsAN6fl7m8ap/bKk5/uxdqXgUgzRagnTT5vtF8XdfedAccQRgizHAr2bBeRWlAIWmX++nCloE2P2YksSvw4nhAttd+i5eI+UnWJdWwuBT9+6H8o8ZDXJg7TQQjDSVwsE2qtHl3JQl9RduzGUiCovipDBZLS+20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771628033; c=relaxed/simple;
	bh=XjDluTQhJ5LENdEz712u79ymW6BSEUDMkLC+LmyHe5E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cXuZotNoY2KEFYanaUR1HdiLVI3XgzuBMidpKfnF0h9BmfbCMAEJbt0rQncbWYgQKRJ3uofP3i4o9ZdQMZGocIi/HaxSa9Y3adbbFO8NuamlZ6/4YY0wjnngzixGegCQAZcIkN/7k7jTvK46yar3dQR5xTIdw6E7cuDIAf1KJiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=wJwKI2uN; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id DA0021A08D8;
	Fri, 20 Feb 2026 22:53:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9F9355FB4D;
	Fri, 20 Feb 2026 22:53:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6788610368D13;
	Fri, 20 Feb 2026 23:53:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1771628026; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=B9YAVyFhgf8N70zdkaB5FsfHpnFqcT5KgJN3J7jNpD4=;
	b=wJwKI2uNyCyvGV0EGMx9ZYc0bNoL9LFwrGd4Q07o8En2+ixgMvu6MLzXblIs+s5nfATW3r
	TatMfBL8l/yMJ7LsTXwErOS1uITTcu9TtVuTrd5G3tSZuyg4dJmCXk5bS5LS//ioH/D0ZF
	F76xzbchss7MtQT5VH/3c1z8yBJH3QsMpRYx8kvanylNDPjIi4qr+yOEULcfQ7Rm7mpQg5
	nosg9V1ujbNpkPg3t69Vog4XRpOiDFN3gOde1/jGCVotYElKL5/KZ/QCpr9J3e4nTfY1ry
	1NZGxiDu8rwKC/rmtEQWZegMR82tXxhElPodXjxXpLionG4Xq5YARJJNnlc4tA==
Date: Fri, 20 Feb 2026 23:53:41 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Ke Sun <sk.alvin.x@gmail.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Ke Sun <sunke@kylinos.cn>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	linux-rtc@vger.kernel.org, rust-for-linux@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>
Subject: Re: [RFC PATCH v3 1/5] rtc: add device selector for rtc_class_ops
 callbacks
Message-ID: <20260220225341c5eeb835@mail.local>
References: <20260116162203.296844-1-sunke@kylinos.cn>
 <20260116162203.296844-2-sunke@kylinos.cn>
 <DFSN0O9RRVD6.1LCI38JKGO1R0@kernel.org>
 <77d373dc-c5f2-4dca-b0d2-b5cee6a21b3b@gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <77d373dc-c5f2-4dca-b0d2-b5cee6a21b3b@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-5989-lists,linux-rtc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,kylinos.cn,gmail.com,garyguo.net,protonmail.com,google.com,umich.edu,vger.kernel.org,linuxfoundation.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexandre.belloni@bootlin.com,linux-rtc@vger.kernel.org];
	DKIM_TRACE(0.00)[bootlin.com:+];
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.local:mid]
X-Rspamd-Queue-Id: D7F1616B550
X-Rspamd-Action: no action

On 20/01/2026 16:01:40+0800, Ke Sun wrote:
> 
> On 1/19/26 22:32, Danilo Krummrich wrote:
> > On Fri Jan 16, 2026 at 5:21 PM CET, Ke Sun wrote:
> > > diff --git a/drivers/rtc/dev.c b/drivers/rtc/dev.c
> > > index baf1a8ca8b2b1..eddcc5a69db3b 100644
> > > --- a/drivers/rtc/dev.c
> > > +++ b/drivers/rtc/dev.c
> > > @@ -410,7 +410,7 @@ static long rtc_dev_ioctl(struct file *file,
> > >   		}
> > >   		default:
> > >   			if (rtc->ops->param_get)
> > > -				err = rtc->ops->param_get(rtc->dev.parent, &param);
> > > +				err = rtc->ops->param_get(rtc_ops_dev(rtc), &param);
> > >   			else
> > >   				err = -EINVAL;
> > >   		}
> > <snip>
> > 
> > > +/**
> > > + * rtc_ops_dev - Get the device pointer for RTC ops callbacks
> > > + * @rtc: RTC device
> > > + *
> > > + * Returns &rtc->dev if RTC_OPS_USE_RTC_DEV flag is set,
> > > + * otherwise returns rtc->dev.parent.
> > > + */
> > > +static inline struct device *rtc_ops_dev(struct rtc_device *rtc)
> > > +{
> > > +	if (test_bit(RTC_OPS_USE_RTC_DEV, &rtc->flags))
> > > +		return &rtc->dev;
> > > +	return rtc->dev.parent;
> > > +}
> > I understand that the idea is to gradually convert all drivers to use the RTC
> > device, rather than it's parent device in RTC device callbacks.
> > 
> > My main concern is that once that has been achieved it's still not what we want
> > to have eventually, i.e. RTC device callbacks should ideally take a struct
> > rtc_device as argument and not the embedded base struct device.
> > 
> > I.e. we'd kick off a conversion process that won't reach the actual desired
> > state.
> Hi Danilo,
> 
> This is indeed an intermediate step.
> 
> Full cleanup is in progress, but it's large and untested. I'm working on a
> complete cleanup involving ~190+ files across arch/, drivers/rtc/, and
> drivers/virtio/. Most changes are straightforward interface replacements,
> but some drivers need additional modifications. Given the scale, I haven't
> fully tested everything and can't guarantee correctness yet.
> 
> The intermediate step enables gradual migration, allowing us to:
> - Clean up and test each rtc driver incrementally
> - Ensure correctness through gradual changes
> - Avoid breaking existing functionality
> 
> Once all cleanup is complete and tested, changing all rtc_class_ops
> callbacks to use struct rtc_device * will be much simpler and safer.
> 
> Currently there seem to be only these two approaches. I'm still waiting
> for Alexandre's suggestion on how to proceed specifically, but haven't
> received a response yet.

I'm sorry, I still don't see the point of doing this. The driver will
almost always need to set its driver data in the parent device because
we need to be able to handle interrupts, suspend/resume or .remove(). So
while intellectually, this would be more satisfying to have the
callbacks take a struct rtc_device, functionally this doesn't have any
purpose because we need to use the parent drvdata anyway.

Said differently, you should explain why a device driver must not call
amba_set_drvdata() ?
Out of 29 drivers, 18 are doing so.

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

