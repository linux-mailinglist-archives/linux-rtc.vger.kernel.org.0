Return-Path: <linux-rtc+bounces-6289-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0PjCFEXez2mn1QYAu9opvQ
	(envelope-from <linux-rtc+bounces-6289-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Fri, 03 Apr 2026 17:35:33 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AC79C395CF4
	for <lists+linux-rtc@lfdr.de>; Fri, 03 Apr 2026 17:35:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C5CF330254C8
	for <lists+linux-rtc@lfdr.de>; Fri,  3 Apr 2026 15:34:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 729AB3C872D;
	Fri,  3 Apr 2026 15:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="PLdECoqD"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 117802848BE;
	Fri,  3 Apr 2026 15:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775230477; cv=none; b=Wap9ImuyWa5FB2UfDmU04M2otfW+ahPNgFeEURAyKZ9FOqMavG3qNuzHWi1PQhF1IcRPsnxXhmJ1mwcs7UiktuLGQtHzVSXucORItCV6ZGAyjei4rQLOK0hNoh0k3UQKwN1IK9bP5pKZO1BezrqFHGJ4k9IZfuNzrYskNIyRS7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775230477; c=relaxed/simple;
	bh=d91cyi0AKprG69puNAS8+9gePFuP43xzY59kJl9XpsU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D/muWRBysF/pQ8vnp1cBxPinvPOp3M8ln+U3DmzE74XaUQ//2TGnNQG8/kOKbxasZk1lAXTacgJU+OkQ5n5uCuGHVklvLbLMqT0KOpxyEtmk0Zyo5ofk4Mi+NhOOR4Ms008kUmytLg1njkegPnpOVegxby5Ae6sEwcTv7sg1ef0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=PLdECoqD; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 9A1341A3129;
	Fri,  3 Apr 2026 15:34:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 614CC603C1;
	Fri,  3 Apr 2026 15:34:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 35D59104500E2;
	Fri,  3 Apr 2026 17:34:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775230471; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=fKf6lhL1pBlSHS/u0Ol+GqkumYjoBi/5pmC+9DOepdE=;
	b=PLdECoqDiASPN2QNkFEx3kvd6CaQ7BNGTFqaReJuEizrzcA+A5OQZw7hfaAY1lo4mMl9SO
	sQJJfS8Qv1Vi5Uo3Ai1oKm3pw3JCPmTn34Hn/fGimXrh+qDs17/x5rAwJegKNWpEMb3yXP
	/PHmZf3qqyCGzbLrF81mP0/ZY1sidqGnDXP62qrZQecFo63omYX8d8955XnFNQlAOHeSj5
	OiZyDt9Xnh9rE4fXwil7KEPbWQGi1xsL8ticdfKL3BXeS9mg5RCo0t7mHWP4gJYNF0ZiHB
	0YLeIMDNzh1mFEdimUhJPzV5asZC4iALu1uCGFbHbvnlwwrsmQu/QYxnZDM4zw==
Date: Fri, 3 Apr 2026 17:34:30 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Linux ACPI <linux-acpi@vger.kernel.org>, linux-rtc@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 0/4] ACPI: TAD: Add alarm support to RTC class device
 interface
Message-ID: <20260403153430561eea9d@mail.local>
References: <2366642.iZASKD2KPV@rafael.j.wysocki>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2366642.iZASKD2KPV@rafael.j.wysocki>
X-Last-TLS-Session-Version: TLSv1.3
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6289-lists,linux-rtc=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[bootlin.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexandre.belloni@bootlin.com,linux-rtc@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: AC79C395CF4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 31/03/2026 21:23:26+0200, Rafael J. Wysocki wrote:
> Hi All,
> 
> This series adds alarm support via the RTC class device interface
> of the ACPI time and alarm device (TAD) driver.
> 
> The code is first rearranged to facilitate re-use (patches [1-3/4]
> and then the RTC class interface of the driver is extended to
> support alarm (patch [4/4]).
> 
> Thanks!
> 

Reviewed-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

> 
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

