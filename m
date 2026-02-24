Return-Path: <linux-rtc+bounces-6070-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +Gp4Bhcrnmn5TgQAu9opvQ
	(envelope-from <linux-rtc+bounces-6070-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Tue, 24 Feb 2026 23:49:59 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 73FA918DAD1
	for <lists+linux-rtc@lfdr.de>; Tue, 24 Feb 2026 23:49:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A246B30CC1B2
	for <lists+linux-rtc@lfdr.de>; Tue, 24 Feb 2026 22:45:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B295349AF8;
	Tue, 24 Feb 2026 22:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="14BWjMDC"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4E8B346A0C;
	Tue, 24 Feb 2026 22:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771973100; cv=none; b=kjL78sngoU3zZltHy6YTQO4Odh1fq0oD6dAWyWhyT9/lkM8DHE1zAqkJ+ttMcdKe1KtcXVPgWmfekV4ZId4xh7nJZLrxMAVcHNbV7epLWKWmUmRge48j/8GpOmRM2ZVz/PFQ/BCiDaOwxi+bLEOE4HTLfpLQo0H5lmPczEkp2cM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771973100; c=relaxed/simple;
	bh=fTxdFyrs1FQ3whu25eWjIsMqrsvQxM/455bEq9ul9Ww=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mcFFaRWXN8pr3fmTTmm68ZQnuJivfJLWuG0VU7FgrKHyaPsEySLB97JOAJlT0ffl0/gKbCwlcuIaVKj2FjGuTxKU02yEdzp+fmzKO32nQ5p09rVFZ6RaQ1BMFhOpRd5Ue4uuP/dXZZd4/IoholMNf5lHXTAVgyBbI28rmnKn5t8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=14BWjMDC; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 08E884E410C2;
	Tue, 24 Feb 2026 22:44:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B441E5FDE5;
	Tue, 24 Feb 2026 22:44:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F22111036907A;
	Tue, 24 Feb 2026 23:44:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1771973093; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=LN908gwoG2M5Xm0QMpbWHhbAFrLqaTiRskdJj1nsIFI=;
	b=14BWjMDC52p3hGZnhCXD5mJQSdvgBLJE9A6yn3LlhMMmMjbs8WupH2hZc+NGeBU+WpsyWe
	g7s87y9gzmwIgE3Qtd7WGMNnU7Tlj60nxqi5RBoGPdjHnIMCIoK2q63CdBcIgOjVhbQIuC
	0xEYd/afPYRDk/ahIvA7pf9w72qO3Hokcg7fIEZRDc0xwT0/JSD5wpIL9T2rgxkcNAtr3c
	DtMCPK3CO4072rrvF4hS+V/NRMByZoljfw6DJPKXqFJKn7c3yWGFEB4y/lDN8eOwkKtM3e
	zVXacI68WzvI7yg1yPzyXzsgHbLq1sMRX3SsnyEcUGdGzs2Ko8legpVXWlaNYg==
Date: Tue, 24 Feb 2026 23:44:49 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Alvin Sun <alvin.sun@linux.dev>, Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	linux-rtc@vger.kernel.org, rust-for-linux@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [RFC PATCH v3 1/5] rtc: add device selector for rtc_class_ops
 callbacks
Message-ID: <20260224224449f141e366@mail.local>
References: <DGKPPQI0QE73.S8I1M5NCI2BV@kernel.org>
 <20260222000556ea1938c0@mail.local>
 <DGLI4H9M0T6D.25RTLDVU5JRBE@kernel.org>
 <CAJZ5v0gtiQxBCknkaOzLKrDqUQfhKh_UjQkvgxJBL4UthbCOkg@mail.gmail.com>
 <DGLMGEZTM7E2.Y8VV9I6LI1P6@kernel.org>
 <DGMR9XOWP1V0.3C9219TYPXV6J@kernel.org>
 <2026022415010804e28202@mail.local>
 <DGNC6GEH8EV7.2WWAQ8DNCLRAB@kernel.org>
 <20260224172822de7f4569@mail.local>
 <DGNJKZA00MNT.2C7NAQYG597MO@kernel.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DGNJKZA00MNT.2C7NAQYG597MO@kernel.org>
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6070-lists,linux-rtc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linux.dev,gmail.com,garyguo.net,protonmail.com,google.com,umich.edu,vger.kernel.org,linuxfoundation.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexandre.belloni@bootlin.com,linux-rtc@vger.kernel.org];
	DKIM_TRACE(0.00)[bootlin.com:+];
	NEURAL_HAM(-0.00)[-0.983];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.local:mid]
X-Rspamd-Queue-Id: 73FA918DAD1
X-Rspamd-Action: no action

On 24/02/2026 23:23:29+0100, Danilo Krummrich wrote:
> On Tue Feb 24, 2026 at 6:28 PM CET, Alexandre Belloni wrote:
> > On 24/02/2026 17:35:23+0100, Danilo Krummrich wrote:
> >> (I did not have any specific hardware in mind when sketching this up (e.g. an
> >> IRQ could also only be needed in bus device callbacks, e.g. for loading firmware
> >> etc.). But for RTC it obviously is common that it is relevant to the class
> >> device too.)
> >> 
> >> So, I assume you mean because there could already be an ioctl before the IRQ has
> >> been successfully registered, and this ioctl may wait for an IRQ?
> >> 
> >> In this case the irq::Registration should go into rtc_data instead to account
> >> for this dependency. Unfortunately, this is a semantic dependency that we can't
> >> always catch at compile time.
> >> 
> >> The reason we sometimes can is because, if you would need access to the
> >> irq::Registration from ioctls (e.g. for calling synchronize(), enable(),
> >> disable() etc.) it would be caught, because you couldn't access it without it
> >> being in rtc_data in the first place, and being forced to have it in rtc_data
> >> guarantees that the ordering can't be wrong.
> >
> > No, once you register the rtc, the character device will appear in
> > userspace and may be opened, at this point, probe is not allowed to fail
> > anymore which you are allowing by trying to register the IRQ so late.
> 
> This does not seem to correspond to my previous reply -- may I kindly ask you to
> read it again?
> 
> Here's also some sketched up code for what I wrote above:
> 
> 	fn probe(pdev: &pci::Device<Core>, info: &Self::IdInfo) -> impl PinInit<Self, Error> {
> 	    let dev = pdev.as_ref();
> 
> 	    let rtc_data = impl_pin_init!(SampleRtcData {
> 	        io: pdev.iomap_region_sized::<BAR0_SIZE>(0, c"my_rtc/bar0")?,
> 	        hw_variant: VendorVariant::StV1,
> 	        irq <- irq::Registration::new(...),
> 	    });
> 
> 	    let rtc = rtc::Device::new(dev, rtc_data)?;
> 
> 	    rtc::Registration::register(rtc)?;
> 
> 	    Ok(Self { rtc })
> 	}
> 
> Note that if any of the RTC callbacks would ever need to call irq.synchronize(),
> irq.disable(), etc. the compiler would enforce correct ordering, as there would
> not be any other possibility to put the irq::Registration other than into the
> rtc_data that goes into rtc::Device::new().

Right but again, the issue is not about the irq or resource allocation
ordering, it is about probe failing after the character device creation.

> 
> Besides that, you above mentioned "probe is not allowed to fail anymore" after
> the RTC device is registered and the corresponding character device becomes
> visible to userspace.
> 
> While there most likely isn't any good reason for probe() to fail afterwards for
> RTC devices, it is not the case that this isn't allowed. We generally can unwind
> from a class device registration. In fact, this is not different to remove()
> being called (immediately).

It is actually different, this was the race back then:

CPU0:                                CPU1:
sys_load_module()
 do_init_module()
  do_one_initcall()
   cmos_do_probe()
    rtc_device_register()
     __register_chrdev()
     cdev->owner = struct module*
                                     open("/dev/rtc0")
    rtc_device_unregister()
  module_put()
  free_module()
   module_free(mod->module_core)
   /* struct module *module is now
      freed */
                                      chrdev_open()
                                       spin_lock(cdev_lock)
                                       cdev_get()
                                        try_module_get()
                                         module_is_live()
                                         /* dereferences already
                                            freed struct module* */


I don't think it has been solved since then.

> 
> Imagine a case where a driver registers multiple class devices, or a class
> device and an auxiliary device, etc.
> 
> (But I assume your point was more that for an RTC device specifically this would
> be odd or uncommon.)

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

