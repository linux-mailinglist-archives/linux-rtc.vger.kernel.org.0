Return-Path: <linux-rtc+bounces-6761-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id maGYBzX+PGrfvQgAu9opvQ
	(envelope-from <linux-rtc+bounces-6761-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Thu, 25 Jun 2026 12:08:53 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C66E6C47F1
	for <lists+linux-rtc@lfdr.de>; Thu, 25 Jun 2026 12:08:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=VMQtoI1a;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6761-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6761-lists+linux-rtc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 829AA3009988
	for <lists+linux-rtc@lfdr.de>; Thu, 25 Jun 2026 10:08:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6B873CE09C;
	Thu, 25 Jun 2026 10:08:49 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BE6C3C2BA4;
	Thu, 25 Jun 2026 10:08:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782382129; cv=none; b=cNRcyrZsQx0ooQ2lvRA8NZ3m+AXhnKlrOB0APadmWef1OUCXFfoXFQB3eBqsWR1llGHdrgqfNMRTQhwSAML0lSObWED1u/LY/SpNoyuU1Dlh7kBNBR9MctXNBCjXI1etvPPa3kVqex3Is+B4XL1UcsNlrQMoMU3b4jA9FX9zQJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782382129; c=relaxed/simple;
	bh=SQBp1/yV1ekWdS6nTZnnRLDYKd2I+3byYL5QANtkNHg=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=mVrgEbcu1WYGt3JHhdGCWJc3xf6F5usHTSImuBxfYjoA2KBMWSkbXWOK4sxkP5IFi4Gd3o+sSpvsNA1pZl9yenttilUBTcRc6dSOQimK2iSJNq8HjH2TfUYJAWmPDmgBFFHBQelAKiZYejeeU6ntKFT9Iojj2QyX0ejlGJ8iYvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VMQtoI1a; arc=none smtp.client-ip=192.198.163.18
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782382129; x=1813918129;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=SQBp1/yV1ekWdS6nTZnnRLDYKd2I+3byYL5QANtkNHg=;
  b=VMQtoI1auc2e+1fxiIZzteqHkV2INnjmnFQiBKpB56E0qJo9Fb0mP70z
   wUmOFgOuN1oLxHFWktMctmPmv5Pyl2yyo+yWDYC5Fw0hN2Qiwt8Th5UAX
   5Ql2Cw6DW0pjb2QMWIFxgA9EmIjHFiOkSD3hpE1O6R6lfmhv8cwiqguqx
   1a2cCXWsix56HxoUQanAa42SiZ9ZKjXaZDzOSokhH1iNKBe4NJijPWtxD
   9UvOUzbOcMiVJlL8L7nQsPZpXLNL1Nn3HgZHhWOoffguNVnXlMMRPnpRw
   T3rH4HE2JbflHXH/ScumrlAwBhiWMx8tPzfFnn4g1HELl5wO77e2S75e3
   g==;
X-CSE-ConnectionGUID: v1Y4xKOhSP+0jC1Prj9+Mg==
X-CSE-MsgGUID: +/FkZLilTr2TOjrnDN7IbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11827"; a="82276680"
X-IronPort-AV: E=Sophos;i="6.24,224,1774335600"; 
   d="scan'208";a="82276680"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2026 03:08:48 -0700
X-CSE-ConnectionGUID: XWgTOkmjTHSllxAY9JmTuA==
X-CSE-MsgGUID: MbtkjO3uQXGUFTFe6b4glQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,224,1774335600"; 
   d="scan'208";a="250697879"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.153])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2026 03:08:45 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 25 Jun 2026 13:08:42 +0300 (EEST)
To: Mario Limonciello <mario.limonciello@amd.com>
cc: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
    Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>, linux-rtc@vger.kernel.org, 
    Thomas Gleixner <tglx@kernel.org>, 
    Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: (subset) [PATCH v2 1/2] rtc: Add rtc_read_next_alarm() to read
 next expiring timer
In-Reply-To: <9415b405-ec6c-425b-8abb-42964f5a2b3a@amd.com>
Message-ID: <f9a3520d-fdf1-25c8-66d1-d5b06d9f73b8@linux.intel.com>
References: <20260521043714.1022930-2-mario.limonciello@amd.com> <178233558814.1517260.7453046865036017375.b4-ty@b4> <9415b405-ec6c-425b-8abb-42964f5a2b3a@amd.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6761-lists,linux-rtc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:mario.limonciello@amd.com,m:Shyam-sundar.S-k@amd.com,m:hansg@kernel.org,m:platform-driver-x86@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-rtc@vger.kernel.org,m:tglx@kernel.org,m:alexandre.belloni@bootlin.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[ilpo.jarvinen@linux.intel.com,linux-rtc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ilpo.jarvinen@linux.intel.com,linux-rtc@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-rtc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,linux.intel.com:mid,linux.intel.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7C66E6C47F1

On Wed, 24 Jun 2026, Mario Limonciello wrote:
> On 6/24/26 14:15, Alexandre Belloni wrote:
> > On Wed, 20 May 2026 23:37:13 -0500, Mario Limonciello wrote:
> > > Add a new function rtc_read_next_alarm() that reads the next expiring
> > > alarm from the RTC timerqueue. This is different from rtc_read_alarm(),
> > > which only reads the aie_timer.
> > > 
> > > The wakealarm sysfs file programs the rtc->aie_timer, whereas the
> > > alarmtimer suspend routine programs its own timer into the RTC timerqueue.
> > > Both timers end up in the RTC's timerqueue, and the first expiring timer
> > > is what gets armed in the hardware.
> > > 
> > > [...]
> > 
> > Applied, thanks!
> > 
> > [1/2] rtc: Add rtc_read_next_alarm() to read next expiring timer
> >        https://git.kernel.org/abelloni/c/947d7ea6f60b
> > 
> > Best regards,
> > 
> 
> Thanks!
> 
> Ilpo, Shyam,
> 
> How do you want to handle patch 2/2?  Immutable branch and come through pdx86?
> Or would you rather it go through Alexandre's tree?

It would be easier if it too goes through Alexandre's tree and I don't 
expect conflicts on that area. I've replied with my Ack to 2/2.

-- 
 i.


