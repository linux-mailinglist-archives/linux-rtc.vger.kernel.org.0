Return-Path: <linux-rtc+bounces-6049-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WL2XDEy+nWnzRgQAu9opvQ
	(envelope-from <linux-rtc+bounces-6049-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Tue, 24 Feb 2026 16:05:48 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9881B188CE3
	for <lists+linux-rtc@lfdr.de>; Tue, 24 Feb 2026 16:05:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 368393020D73
	for <lists+linux-rtc@lfdr.de>; Tue, 24 Feb 2026 15:01:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05BA93A0EB7;
	Tue, 24 Feb 2026 15:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Z+/ejAEd"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD0D720E03F;
	Tue, 24 Feb 2026 15:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771945275; cv=none; b=uRd/vZKL8kMgRAIZIS4QSVNiTwfCquSpqps7UMIJqJW7NJL8Mx8So93PjAsirCuWeWCsJqiUIIXKc9ZH5f8NNCkYyflwJEmHtjtijwGE4xAjseF9mY20RAzCLQO7S0xfThvignLFKKalgVzJX5dUz0/5g4nHuRIeoGEnMHO4OVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771945275; c=relaxed/simple;
	bh=+8tg8YyJZS21oRbVZxYHIg/mWJwBODXnJ25M6xiUEHE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Giooe0PqErA3yuchyqwwrhimMt82QTJ3311+w97qF0ZCBBQyrGLeE41g3sF2Wue8ZScmsvz+vlC2MBEGhEkxIN09A+1KZCgtVhldbTZO4JzRlLe02uBcbL/x/wtcfwGlrsoeOgYTzYyFgkSFn5O+UeRAm75/G+Zv82DV6tsb5vI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Z+/ejAEd; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 9553A4E41098;
	Tue, 24 Feb 2026 15:01:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6155D5FD9D;
	Tue, 24 Feb 2026 15:01:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4B7E91036918C;
	Tue, 24 Feb 2026 16:01:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1771945272; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=AJiTTJJBybIJBuijUO+MwU3XJQ3ej3P9lcVw8dsu7tw=;
	b=Z+/ejAEdzBAzl4tzD2i58OC82+9+Fi9Mfx4oXg38fGGR58Rlh2ZZaHVSTXXHHav5opIrxm
	16n7vnfVzWyK8rO+KrcEOa97+2oRsYwRf/yiX82rD9cW8yaYgwl78OxJ8IR/23COxOdh/Z
	H5PRq50mZg/VE+o0H+vAUTIHl8lUZTOSmSduvw5rvwokJxoFNmzfQRILz2b+i84fkehhDY
	RS4ZypSQEI5HCvtz4ezeIfQm/vDbTll4SjN0+kzMuOGHNDOBYNRbz2stlZVuChn/qQ52tW
	Cn7UdfRUGFmRbN0DYOcFI1wWWIHd5OzuTImdK55Cozl7UuFe8MWWfhPALP8zdA==
Date: Tue, 24 Feb 2026 16:01:08 +0100
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
Message-ID: <2026022415010804e28202@mail.local>
References: <20260220225341c5eeb835@mail.local>
 <d1c9e33b-e1f3-41c6-af5e-a85fe2b86d10@linux.dev>
 <20260221111619162a41a1@mail.local>
 <CAJZ5v0jo2sLKWVOBJz7QP9x_aMZbaVx+ES7QwYWkTzHp7d2xLQ@mail.gmail.com>
 <DGKPPQI0QE73.S8I1M5NCI2BV@kernel.org>
 <20260222000556ea1938c0@mail.local>
 <DGLI4H9M0T6D.25RTLDVU5JRBE@kernel.org>
 <CAJZ5v0gtiQxBCknkaOzLKrDqUQfhKh_UjQkvgxJBL4UthbCOkg@mail.gmail.com>
 <DGLMGEZTM7E2.Y8VV9I6LI1P6@kernel.org>
 <DGMR9XOWP1V0.3C9219TYPXV6J@kernel.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DGMR9XOWP1V0.3C9219TYPXV6J@kernel.org>
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6049-lists,linux-rtc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linux.dev,gmail.com,garyguo.net,protonmail.com,google.com,umich.edu,vger.kernel.org,linuxfoundation.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexandre.belloni@bootlin.com,linux-rtc@vger.kernel.org];
	DKIM_TRACE(0.00)[bootlin.com:+];
	NEURAL_HAM(-0.00)[-0.985];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.local:mid,bootlin.com:url,bootlin.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9881B188CE3
X-Rspamd-Action: no action

On 24/02/2026 01:12:32+0100, Danilo Krummrich wrote:
> Let's have a look at how probe() looks like for the example below, which is what
> we do in other subsystems, such as DRM or PWM.
> 
> > Example 3:
> >
> >	struct SampleIrqData {
> >	    rtc: ARef<rtc::Device>,
> >	};
> >
> > 	// The bus device private data.
> > 	#[pin_data]
> > 	struct SampleDriver {
> > 	    #[pin]
> > 	    irq: irq::Registration<SampleIrqHandler>,
> > 	    rtc: ARef<rtc::Device<SampleRtcData>>,
> > 	}
> >
> > 	// The class device private data.
> > 	struct SampleRtcData {
> > 	    io: Devres<IoMem<PL031_REG_SIZE>>,
> > 	    hw_variant: VendorVariant,
> > 	}
> >
> > 	impl rtc::Ops for MyRtcOps {
> > 	    type BusDeviceType = platform::Device<Bound>;
> >
> > 	    fn read_time(
> > 	        rtc: &rtc::Device<SampleRtcData>
> > 	        parent: &platform::Device<Bound>,
> > 	        time: &mut rtc::Time,
> > 	    ) -> Result {
> > 	        let io = rtc.io.access(parent)?;
> >
> > 	        match rtc.hw_variant {
> > 	            VendorVariant::Arm | VendorVariant::StV1 => {
> > 	                let my_time = io.read(...);
> >
> > 	                my_time.write_into(time);
> > 	            },
> > 	            VendorVariant::StV2 => { ... },
> > 	        }
> > 	    }
> > 	}
> >
> 
> 	impl pci::Driver for SampleDriver {
> 	    fn probe(pdev: &pci::Device<Core>, info: &Self::IdInfo) -> impl PinInit<Self, Error> {
> 	        let dev = pdev.as_ref();
> 
> 	        let rtc_data = impl_pin_init!(SampleRtcData {
> 	            io: iomap_region_sized::<BAR0_SIZE>(0, c"my_rtc/bar0")?,
> 	            hw_variant: VendorVariant::StV1,
> 	        });
> 
> 	        let rtc = rtc::Device::new(dev, rtc_data)?;
> 
> 	        // Internally calls `devres::register(rtc::Registration::new())`.
> 	        rtc::Registration::register(rtc)?;
> 
> 	        Ok(impl_pin_init!(Self {
> 	            // Give the IRQ handler a reference count of the `rtc::Device`.
> 	            irq <- irq::Registration::new(..., rtc.clone()),
> 	            rtc,
> 	        })

I can't really read rust yet but this seems to open a race condition
with userspace if irq::Registration::new(...) fails, there is an
ordering constraint you missed.

> 	    }
> 	}
> 
> With this there are no (subtle) ordering constraints the driver has to get
> right; ownership and lifetimes are well defined.
> 
> (I.e. whatever order a driver picks, it either works properly or it does not
> compile in the first place, which is a huge improvement over the situation we
> have in C.)

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

