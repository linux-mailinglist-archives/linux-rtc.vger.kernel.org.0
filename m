Return-Path: <linux-rtc+bounces-5121-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 236ADBF8F2D
	for <lists+linux-rtc@lfdr.de>; Tue, 21 Oct 2025 23:35:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EB1D418A40E9
	for <lists+linux-rtc@lfdr.de>; Tue, 21 Oct 2025 21:35:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E57DD28CF5F;
	Tue, 21 Oct 2025 21:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b="LDDwlNL/";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="trU68A4Y"
X-Original-To: linux-rtc@vger.kernel.org
Received: from fhigh-a6-smtp.messagingengine.com (fhigh-a6-smtp.messagingengine.com [103.168.172.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9774127FD71;
	Tue, 21 Oct 2025 21:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761082526; cv=none; b=eL89Dr4EkaFAkL1BbC0XNCrzn363i1sz1pP0t0OZIJjGvo8KghsXrGKs4NqlD4LNnRsNDyy1wEADEpmuKXvGlk/r7k0xJy7TOH5u8Q4DdjaeK8QF2xzXWBjD0Ylc1dbERNOh3CwU2Iim+MsRAj6uCBYGbl9iNbfTne73Z1jmG0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761082526; c=relaxed/simple;
	bh=YOmO0aTYC7u74cdNwBX4yqTPJteWYgGn+TnC9SPFm5c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JIJO2DYjUyeYA/LzfFd5dzOcij03UIPftgx1RSBBzSOYwWGTioNA5rVvRYLKT9kpyCU3yp20r3JnFtzVYhDG3gZKD6I2bHKhQ1LuYiuO3rDap+bFGbEWNTZ9yDBAg6daQ8ETVeVBXIT/uMyEXWas3tGNH1wkxWia4cxIoUf92sI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net; spf=pass smtp.mailfrom=jannau.net; dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b=LDDwlNL/; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=trU68A4Y; arc=none smtp.client-ip=103.168.172.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Received: from phl-compute-07.internal (phl-compute-07.internal [10.202.2.47])
	by mailfhigh.phl.internal (Postfix) with ESMTP id C07911400152;
	Tue, 21 Oct 2025 17:35:23 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-07.internal (MEProxy); Tue, 21 Oct 2025 17:35:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1761082523; x=1761168923; bh=SSmc773k1o
	hUjKBtXPg8Ooubnfa2H2zZUHk2E3oNqks=; b=LDDwlNL/Civ8KvUV+4wSIqn9Fp
	dC6gnUKVTULSO8HojwWFrG0YZyvJvkw047KbdqBA7pfC00sxISkseQmGwM8ejAOE
	99UrKxGX2dVr3c3gC+DjTGIx7gUjwczI48oyUPRmuP6bFpRZS4oWtedTLRd6IALo
	1NhTCrbJvbY4KxFA0AJWSHCdhJHb1JW1Vm64AgpwnRzV6gpxaH1eLNqkyUmFz3N0
	f8GCTKCEaLeOLmz1SEjBIrPUGjcg2MUHuMOPyRBv+S335R3kR441Ij5gQhh+aTvZ
	9kSHQTNM8/8s8x5ZMPB3nmz5rpEKs9sh7GU+H9oXK2lB7VTeFTthCfJeHJ3Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1761082523; x=1761168923; bh=SSmc773k1ohUjKBtXPg8Ooubnfa2H2zZUHk
	2E3oNqks=; b=trU68A4YzeRx8nSBoXV7wr6rGsygStp9hhqPoTrWvrwH7020yWy
	LbwZZQTk1JTQFfsyu7YxbX8GIQDPk4hF8h/qLr8e1zhJpVDaCn0gd+jvvHc/St8U
	PfTGJ7mUgGZQ5LLORJQiWSHFwv97yTDg8ML1SY5Ehe4Z8JJyFs5kp8VGijgdW12w
	H+q6zOyeZWpERBinzuxMlrx4mvf/1P20p36MaDEI1FyWT+5HWJGykX2U17KDxH63
	iuZk4CH7K6ZGiBXNSbr/Te3xOiAL2H0nqorV6bVY4LYcmqrCVlBbeh3pTiWs087G
	fIURyiYh/cVImYO19CBb9EWzpskuQ3u70GA==
X-ME-Sender: <xms:mvz3aH6CC7ccxitepgQOV4dRf5ycIb3MyGp5fup00yTr9aRmZcxk8w>
    <xme:mvz3aNR3WqFDe4caBONWo_J67I3zv6_Kgwz3EemEAqUyQhrxbPcQqCmnF4S39S-wp
    PzKQ_6NQAcYn3zqdXJ_tGN-swiq389HUvU72M0EfweI5HMXfgcT9pc>
X-ME-Received: <xmr:mvz3aPmKV8lSi3JXACietOeMwXek-wkDaW7hS6ij3kVUWd7Fu3q5gI9k3nMzzl27h7VZ18xiElJUB3-Q2apck-1pizG1VUQUTK2WKBWCyrun-YkCsA1vAkLbbQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddugedujeelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtjeenucfhrhhomheplfgrnhhnvgcu
    ifhruhhnrghuuceojhesjhgrnhhnrghurdhnvghtqeenucggtffrrghtthgvrhhnpefgvd
    ffveelgedujeeffeehheekheelheefgfejffeftedugeethfeuudefheefteenucevlhhu
    shhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjsehjrghnnhgruh
    drnhgvthdpnhgspghrtghpthhtohepvddtpdhmohguvgepshhmthhpohhuthdprhgtphht
    thhopegumhhithhrhidrthhorhhokhhhohhvsehgmhgrihhlrdgtohhmpdhrtghpthhtoh
    epjhgtrghllhhighgvrhhoshelleesghhmrghilhdrtghomhdprhgtphhtthhopehsvhgv
    nheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghlhihsshgrsehrohhsvghniiifvg
    highdrihhopdhrtghpthhtohepnhgvrghlsehgohhmphgrrdguvghvpdhrtghpthhtohep
    lhgvvgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdroh
    hrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthho
    pegtohhnohhrodgutheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:mvz3aEKTfwowrvGhnvf4-EXiYQ8vvIQIVEZ1iWF8JuUJEl7pOxPTwQ>
    <xmx:mvz3aKQDpq6pdomkmnXR8DESBXdjiu6JkQoLsyLelbx_7tE1yw2-gg>
    <xmx:mvz3aKSM4MHm3ClKfeaqTHWz-nMYXtQafAIa1bNW_e28Sx97dtMPEg>
    <xmx:mvz3aEzXTHBa5YFFaUthIK9hhDlQyKhib1n9PXB56vtmvPVKipSSUA>
    <xmx:m_z3aIN6XjMCVaeHimR80BQvfCuR37CLmoygwdxALuTo15O-_yFWnP9x>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 21 Oct 2025 17:35:21 -0400 (EDT)
Date: Tue, 21 Oct 2025 23:35:20 +0200
From: Janne Grunau <j@jannau.net>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: James Calligeros <jcalligeros99@gmail.com>,
	Sven Peter <sven@kernel.org>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Neal Gompa <neal@gompa.dev>, Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-input@vger.kernel.org,
	Hector Martin <marcan@marcan.st>
Subject: Re: [PATCH v2 07/11] input: macsmc-hid: New driver to handle the
 Apple Mac SMC buttons/lid
Message-ID: <20251021213520.GA2546203@robin.jannau.net>
References: <20250827-macsmc-subdevs-v2-0-ce5e99d54c28@gmail.com>
 <20250827-macsmc-subdevs-v2-7-ce5e99d54c28@gmail.com>
 <qffp7kadq3xojla5k6f5pr37irgytqfsqvabr6ydvulxnkcgnn@bv5mrraxrhhe>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <qffp7kadq3xojla5k6f5pr37irgytqfsqvabr6ydvulxnkcgnn@bv5mrraxrhhe>

On Fri, Aug 29, 2025 at 11:11:22AM +0000, Dmitry Torokhov wrote:
> Hi James,
> 
> On Wed, Aug 27, 2025 at 09:22:41PM +1000, James Calligeros wrote:
> > +static void macsmc_hid_event_button(struct macsmc_hid *smchid, unsigned long event)
> > +{
> > +	u8 button = (event >> 8) & 0xff;
> > +	u8 state = !!(event & 0xff);
> > +
> > +	switch (button) {
> > +	case BTN_POWER:
> > +	case BTN_TOUCHID:
> > +		if (smchid->wakeup_mode) {
> > +			if (state)
> > +				pm_wakeup_hard_event(smchid->dev);
> > +		} else {
> > +			input_report_key(smchid->input, KEY_POWER, state);
> > +			input_sync(smchid->input);
> > +		}
> 
> I believe you should be using pm_wakeup_event() in all cases so that
> pressing power would interrupt suspend even if resume() handler has not
> been run yet.

pm_wakeup_event() does not wake from s2idle. pm_wakeup_dev_event()'s
`hard` parameter is explicitily documented to wake from s2idle. So using
pm_wakeup_dev_event and use `smchid->wakeup_mode && state` as hard
parameter seems the correct thing to do.

> Also I do not think suppressing KEY_POWER is needed.
> Userspace should be smart and decide whether to shutdown the system or
> not when receiving KEY_POWER depending on the overall system state.

Not all user space. Using the power button to wake from s2idle while
showing agetty's login prompt on a tty results in an immediate shutdown.

Janne

