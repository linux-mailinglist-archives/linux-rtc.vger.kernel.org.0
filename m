Return-Path: <linux-rtc+bounces-6333-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wMcjE0tE3mlvpwkAu9opvQ
	(envelope-from <linux-rtc+bounces-6333-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Tue, 14 Apr 2026 15:42:35 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BA3D73FA9EB
	for <lists+linux-rtc@lfdr.de>; Tue, 14 Apr 2026 15:42:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4CDCE3032667
	for <lists+linux-rtc@lfdr.de>; Tue, 14 Apr 2026 13:39:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22BEE25B2F4;
	Tue, 14 Apr 2026 13:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="LiCSD+Rt"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B54C217723
	for <linux-rtc@vger.kernel.org>; Tue, 14 Apr 2026 13:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776173970; cv=none; b=Wiiwubj2XDx14Z/NfXGCMX4D0Ht0mdTsZhqiU0jgc+3IQRoj7JyJxNZxdCFPQJ3eOcOOaFLQNpTx2ChePIeQ9L4VZyuppoYHw1WUKDEPRU5nsZqkqbBDI+Mo1Oxw3s2qzaASg4HuhcShs10aVPT/JUNcq9NVhm8F1txqVWo6ctM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776173970; c=relaxed/simple;
	bh=ECE0mI9GR/AjVeA+NFLOneGgbRq3bbu2YZJyFZ9jAKg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NqAvU+6p+9GGox+M/k7jHO1ZXD+DDnxONOxZlj01RuMeWjl4eNv53LJyawQfhiHInotU6gkoUQceZPOJOZ1DJUt5xbWYc5rSuM8QChBjYuzoo5gbcIlNweAvcB/B7lYIK4n8jgmwJCjNbLxzMrZX7XM0Dony3+98GVi0ZjCDDG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=LiCSD+Rt; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id ADF23C5AAAC;
	Tue, 14 Apr 2026 13:40:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9600160410;
	Tue, 14 Apr 2026 13:39:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6344310450F41;
	Tue, 14 Apr 2026 15:39:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776173964; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=hhMnLbhf8ggR0psN0CFGzh4quv6o+O9enO3WqiNnu3o=;
	b=LiCSD+RtzTyobA7qaSnl4o3g9JEN8G3F58/23G5kCKVRfrTEBUJcK3LnKNJe6wPFCsdf42
	lpMTSUwF91T5CRJCVWjH4ZSJHAbeGlsnpAykasqDFXBDxd5A63+OC0tNLYB/3HHxSbY2BP
	/u+TVwjqajmFeH/MFYox3IRh/NE4VCDjGB9eXntpWLlXvYk/wtTtY4ifaEsD6razoSmU18
	Fo5YZ/Mn4fn5SItkFcvUN6sT2l3NWBnZaoJsJrtgn321XYHfR+IxU+9tzxpZsVN4FI5dCx
	2hovpkjsTxRp2l0gNl00NVFeGxMyEWkJ1ma7THGRmjQd1fgBNRm/5ySmOWA1Bg==
Date: Tue, 14 Apr 2026 15:39:22 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Takumi Ando <takumi@spacecubics.com>
Cc: "T, Harini" <harini.t@amd.com>, Tomas Melin <tomas.melin@vaisala.com>,
	"linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
	"Simek, Michal" <michal.simek@amd.com>,
	Yasushi SHOJI <yashi@spacecubics.com>,
	kanta tamura <kanta@spacecubics.com>
Subject: Re: [QUESTION] rtc: zynqmp: CALIB_RD reset behavior differs between
 ZynqMP and Versal
Message-ID: <202604141339228da622c7@mail.local>
References: <CAJACUaoFK-GiBN_hfkNajDUygnSZc29U_jdeQ_rKtXS7P1f-nw@mail.gmail.com>
 <9ed6823e-b381-4de5-b1cf-98f5dc54bb7c@vaisala.com>
 <202603061113298cbba29d@mail.local>
 <CAJACUaqHDJOZY-jgriGRX=DE=e3rvBgvycjO1exxQ7k1XdywpA@mail.gmail.com>
 <ac27be8f-363e-42e6-8b46-e95ab739762a@vaisala.com>
 <CAJACUapT3cNwQtyE1zmQcGfDex2jmrbvvd9vOvZhC3v8+h3cZQ@mail.gmail.com>
 <6ea7ad01-3bf1-45b0-a06b-85e2b9c0f83b@amd.com>
 <CAJACUaqc6B_cWp0is5gQ9Sw=Jmf-bjxCqdg5PJu9F=oWWMa9+w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJACUaqc6B_cWp0is5gQ9Sw=Jmf-bjxCqdg5PJu9F=oWWMa9+w@mail.gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[bootlin.com:+];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-6333-lists,linux-rtc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexandre.belloni@bootlin.com,linux-rtc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-rtc];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	REDIRECTOR_URL(0.00)[aka.ms];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,amd.com:email,amd.com:url,bootlin.com:dkim,bootlin.com:email,bootlin.com:url,aka.ms:url,vaisala.com:email]
X-Rspamd-Queue-Id: BA3D73FA9EB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 14/04/2026 18:08:03+0900, Takumi Ando wrote:
> Hi Harini,
> 
> Thank you for your reply.
> 
> So, if I understand correctly, calibration should be performed periodically
> from userspace via /sys/class/rtc/rtcX/offset.
> 
> In that case, would it be correct to say that, in the current driver,
> programming
> the CALIB_WRITE register from the DTB during probe is not only ineffective,
> but may actually be inappropriate, since the initial value is
> undefined and there
> is no reliable way to determine whether it has already been initialized?

This is correct.

> 
> Best regards,
> 
> 2026年4月9日(木) 20:11 T, Harini <harini.t@amd.com>:
> 
> >
> > Hi,
> >
> > On 3/11/2026 12:22 PM, Takumi Ando wrote:
> > > [You don't often get email from takumi@spacecubics.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> > >
> > > Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
> > >
> > >
> > > Hi Tomas,
> > >
> > > Thanks for the clarification.
> > >
> > > My understanding is that the fractional correction (fract_data) should
> > > indeed be managed from userspace since it represents oscillator drift
> > > and may change over time.
> > >
> > > However, the Max_Tick field seems to have a different role: it defines
> > > the number of RTC oscillator cycles corresponding to one second.
> > > For example, with a 32.768 kHz oscillator the value should be 32768-1.
> > >
> > > This is how I interpreted the documentation as well.
> > > In the AM012, the description of Max_Tick says that the
> > > register value multiplied by the oscillator period should equal one
> > > second, and it explicitly states that for a 32.768 kHz oscillator the
> > > value will be 0x7FFF.
> > >
> > > Because of this, it appears that Max_Tick depends only on the oscillator
> > > frequency and should not change dynamically like the fractional
> > > correction.
> > >
> > > Did I misunderstand the purpose of the Max_Tick field?
> >
> > Your understanding of the Max_Tick field is correct. However, in the
> > driver's set_offset() implementation, the ppb offset is decomposed into
> > a whole-tick adjustment (which modifies the Max_Tick) and a
> > fractional-tick adjustment (fract_data).
> > Both fields are written together to the calibration register in a single
> > operation. This is what Tomas was referring to when he said both may change.
> >
> > Since the crystal is never exactly 32.678 kHz and its frequency varies
> > with temperature and aging, userspace must always compute and apply
> > correct offset. When it does so via /sys/class/rtc/rtcX/offset, the
> > entire calibration register including Max_Tick is programmed to the
> > appropriate value.
> >
> > Additionally writing Max_Tick unconditionally during probe would destroy
> > a valid calibration value that may have been preserved across a warm
> > reboot on a battery-backed RTC.
> >
> > Thanks,
> > Harini T
> >
> > >
> > > Best regards,
> > >
> > > 2026年3月11日(水) 14:23 Tomas Melin <tomas.melin@vaisala.com>:
> > >>
> > >> Hi,
> > >>
> > >> On 11/03/2026 05:19, Takumi Ando wrote:
> > >>> [You don't often get email from takumi@spacecubics.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> > >>>
> > >>> Hi Tomas, Alexandre,
> > >>>
> > >>> Thank you for the explanations.
> > >>>
> > >>> So if I understand correctly, both on Zynq UltraScale+ and Versal,
> > >>> CALIB_RD may return a non-zero (or otherwise undefined) value after
> > >>> reset, meaning that it cannot reliably be used to determine whether
> > >>> the calibration register has already been initialized.
> > >>>
> > >>> While the fractional calibration should indeed be handled from
> > >>> userspace (e.g. via the RTC offset interface), it seems that the
> > >>> Max_Tick field should still always be programmed according to the
> > >>> value provided in Device Tree, since it depends only on the RTC
> > >>> oscillator frequency.
> > >>
> > >> Both max_tick and fract_data might change, it depends on how big
> > >>
> > >> the calibrator drift/offset is and if it is negative/positive.
> > >>
> > >>>
> > >>> Would it make sense for the driver to always program Max_Tick from the
> > >>> Device Tree "calibration" property while preserving the fractional
> > >>> calibration bits currently stored in hardware?
> > >>
> > >> As Alexandre mentioned, user space needs to ensure calibration is what
> > >> it should be.
> > >>
> > >>
> > >> thanks,
> > >>
> > >> Tomas
> > >>
> > >>
> > >>>
> > >>> If this approach sounds reasonable, I would like to prepare a patch
> > >>> for upstream.
> > >>>
> > >>> Best regards,
> > >>>
> > >>> 2026年3月6日(金) 20:13 Alexandre Belloni <alexandre.belloni@bootlin.com>:
> > >>>> On 06/03/2026 12:09:40+0200, Tomas Melin wrote:
> > >>>>>> On Zynq UltraScale+ Devices Register Reference (UG1087) [2],
> > >>>>>> CALIB_RD resets to 0, so the current logic works correctly there.
> > >>>>>> However, this assumption does not appear to hold for Versal.
> > >>>>> For Ultrascale+ the calibration register also gives random values after
> > >>>>> reset, perhaps you have noticed this:
> > >>>>> https://adaptivesupport.amd.com/s/article/000036886?language=en_US. Maybe
> > >>>>> the same can occur also on Versal.
> > >>>>>
> > >>>>> AFAIK there is no way of knowing if the value is correct or not after reset,
> > >>>>> so user space helpers might be needed to maintain the calibration value at a
> > >>>>> desired value.
> > >>>>>
> > >>>> Userspace is always needed to put the proper calibration, there is no
> > >>>> way for the kernel to know what value to put there. In the support case
> > >>>> above, the crystal will never be exactly 32768Hz and this value will
> > >>>> change over time and also depends on the temperature. The value always
> > >>>> needs to be computed, if your device can do NTP, chrony will provide the
> > >>>> proper offsets. If you don't have a way to measure the deviation, then
> > >>>> userspace can always forcefully set /sys/class/rtc/rtcX/offset if it
> > >>>> doesn't hold the correct value.
> > >>>> There is no need for devmem here.
> > >>>>
> > >>>> --
> > >>>> Alexandre Belloni, co-owner and COO, Bootlin
> > >>>> Embedded Linux and Kernel engineering
> > >>>> https://bootlin.com/
> > >>>
> > >>>
> > >>> --
> > >>> Takumi Ando
> > >>> Space Cubics Inc.
> > >
> > >
> > >
> > > --
> > > Takumi Ando
> > > Space Cubics Inc.
> > >
> >
> 
> 
> --
> Takumi Ando
> Space Cubics Inc.

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

