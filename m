Return-Path: <linux-rtc+bounces-1418-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9525891B69D
	for <lists+linux-rtc@lfdr.de>; Fri, 28 Jun 2024 08:02:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 01A55B22A3E
	for <lists+linux-rtc@lfdr.de>; Fri, 28 Jun 2024 06:02:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 546C23FB88;
	Fri, 28 Jun 2024 06:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="updtDB9r";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="rFvx7AVt"
X-Original-To: linux-rtc@vger.kernel.org
Received: from fhigh6-smtp.messagingengine.com (fhigh6-smtp.messagingengine.com [103.168.172.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C559B5339D;
	Fri, 28 Jun 2024 06:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719554528; cv=none; b=Ur0sNwHPyZ3YwhqDc4nMOcZq8AVsdCADPY9LLtpeLrfIX6wXZYFqiDPZg1jy+R5PjibxRBiB1HI/HPPmfm7e2d7srHzcJxbmKa+GOnnLkJchS3VLKLt//aJmVmd7ik2plVpYS0FKVW/q/fiOS7T9DvFvrVc9p4en6lhT7vM8/So=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719554528; c=relaxed/simple;
	bh=zuWah5kZxS3pZarT8R17vunXfD+W32qerb5RNvhglH0=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=ZLYQ+pokp3AVZBxEWalkX5h9BqSNH6YSkhfRNObvHJ3O7oHld45PWGlLIzaAF/r3odnh3EcbQI/U1XnEQ2+yMzEKCQzcDzO6rGg9JFw0rwG1TrDIGPZcqtHNDjBqO/ApvvqTNyvT5jlXQNusbjHpLn86gWF01DM4o7kJft7DSvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=updtDB9r; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=rFvx7AVt; arc=none smtp.client-ip=103.168.172.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id A880C114034E;
	Fri, 28 Jun 2024 02:02:04 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Fri, 28 Jun 2024 02:02:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1719554524; x=1719640924; bh=4SpXJxdF2J
	M31Xlhpwa+WUi534LwLf04YEhMqMWuizA=; b=updtDB9r6x1SULisZC2ytkI5+8
	RLEWde4H5ifpqSJ67IjREPob9gA1Bpvm24fhp2c/bdb2LTxhxJ1jLhk4kQM1ht82
	35GMtLbq1W6fmd5eRU8q0AaMO4zDwnc34Qw78GNq2GnZE6FNbo2DiKK8DRCPmrrR
	T0wcxjSOTgUHjbK00Krzy0eBiIC0v1joogq4rPmCFe6lQeBw35jJwcVvS+Kk63C6
	CLrnFaciaIybcH18kK/wJs1GcoIBIqicz1LEgpCSo0CnSuba8N7lQydeBoYkfFhY
	TjT9QW8n+fUZC/i24CPgIg4agfPSbVx5JzuH1IJvVnyvDkM09MZpvppFWg/Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1719554524; x=1719640924; bh=4SpXJxdF2JM31Xlhpwa+WUi534Lw
	Lf04YEhMqMWuizA=; b=rFvx7AVtspBJNVsuTn6h4Y/MObReH3kzZWYz3MHDV/sR
	7ZaPLnAKc3YaiEJMc5gP/IPKjs2AgqUFLlsNtwMx8NtmOcNENnP4K23z32SqGV1U
	jO6a8ToLDNqYAKa7wUDtPK+KVJymndD6B0trwAj05cq2jpSOI3yVSNiE7W+ynFQc
	i76jCpYQWlCahLLwmCcJhaORlt6ZnrtaOh0Aul3KuZ3pQ1kcjoHcoz7HX6Fz+f+P
	DBnW5ojh+xxCEPVBlcUn5H5sXRt3Z7jwG41rGr23OA6i8CHO5sSv15NFsPBjagE/
	2PVEq6FwRyDW/KEAR7xvARqziwLxsBjY+Iu1XGZ1vA==
X-ME-Sender: <xms:3FF-ZmFi-0wEFJrEtNWcNxB5iP56CR0_BBE32xRL-jxl6EIA2pNNTg>
    <xme:3FF-ZnUlzrhCwUvDMLRjt-OH3MPkP7WMIS96cqU_OaoCSe-ZO03FQKeRu9dFbB02a
    PDFjoiXLV7St-yC8_w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrtdehgddutdehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:3FF-ZgJpqdpT1a1mRI-L1MrqyOPErGiDigMsdlscL1jvXZ1_J319Ug>
    <xmx:3FF-ZgHuNB0viBDC9f7DMP-1CDlvY_gX4MTInuDLkxQyfr-_5WhNSw>
    <xmx:3FF-ZsUAjoBPnAa9dvtDCxvFazRpiNyWF6b9L_cdOro22cvBneHOaQ>
    <xmx:3FF-ZjPuqV2KW1ip3FutqTBlp6xGsZDi2nW1rvKrDroNcwDjLu74qw>
    <xmx:3FF-ZqwoMcBBY6fq1mhfJILN7DVr8W9BP-29Vh9m9kb5wbZ6KF6eHbUE>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 0F603B6008D; Fri, 28 Jun 2024 02:02:03 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-538-g1508afaa2-fm-20240616.001-g1508afaa
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <1d82ecbb-c9fa-49e0-8432-7fd152e01440@app.fastmail.com>
In-Reply-To: <20240627224321db4557b2@mail.local>
References: <cf6ac9542f58a33b146ad7b0f5577e1dff3becab.camel@phytec.de>
 <20240627224321db4557b2@mail.local>
Date: Fri, 28 Jun 2024 08:01:30 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Alexandre Belloni" <alexandre.belloni@bootlin.com>,
 "Leonard Anderweit" <L.Anderweit@phytec.de>
Cc: "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "upstream@phytec.de" <upstream@phytec.de>
Subject: Re: Question about [PATCH] [RFC] rtc: y2038: remove broken RTC_HCTOSYS
 workaround
Content-Type: text/plain

On Fri, Jun 28, 2024, at 00:43, Alexandre Belloni wrote:
> On 24/06/2024 11:41:41+0000, Leonard Anderweit wrote:
>> Hi,
>> 
>> I found this patch [1] which is necessary for a project I'm currently
>> working on. I'm using phyboard-wega [2] with an am335 ARM SoC which I
>> want to make y2038 proof.
>> Is there any reason it was never accepted?

Sorry for not having replied earlier. I'm definitely interested
in helping to make this work better, having spent a lot of time
on the kernel side of the y2038 work.

Which combination of distro, libc and init system are you using
in your work?

Are you running with COMPAT_32BIT_TIME disabled? This is something
you probably want in order to better test for corner cases that
still use time32 kernel ABIs somewhere, but it still requires
adding a few more workarounds in libc and other userspace
sources.

> The systemd maintainer think the kernel is well placed to take a
> decision it can't actually take so they won't fix a bug where systemd is
> crashing when userspace is 32bit.
>
> The whole situation is frustrating and honestly, nobody should use the
> hctosys insanity anyway. Obviously systemd mandates its usage and this
> is yet another topic on which they think the kernel is better placed to
> take decisions that are actually userspace policy.
>
> I've been arguing for a while and gave up.

I thought that systemd had at least fix the bug where it would
crash when a random 64-bit time was set, so we could try again
with this patch and see what breaks?

An important difference now is that Debian is finally changing
to a time64 userspace, which both avoids the problem that
the broken rtc_hctosys() time truncation was trying to work
around (all times returned here are now valid) and it means
that there is a much higher incentive to actually make
a systemd based userland work past 2038.

      Arnd

