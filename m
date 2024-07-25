Return-Path: <linux-rtc+bounces-1576-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D98B93BC3E
	for <lists+linux-rtc@lfdr.de>; Thu, 25 Jul 2024 07:54:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8C7521C230D4
	for <lists+linux-rtc@lfdr.de>; Thu, 25 Jul 2024 05:54:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BEFE13DDBD;
	Thu, 25 Jul 2024 05:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RJ85KjAf"
X-Original-To: linux-rtc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4506D1422D8
	for <linux-rtc@vger.kernel.org>; Thu, 25 Jul 2024 05:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721886871; cv=none; b=WSCSBm80v+hdS5Rdl5IRjeIKRtqipq+rPa5ABb1e3fqiUWvYjS5Qk+WU+ASPS8qVFsxHpa3kYaKCpgUKfohWQ9b5G6Eg4fnLqkt6Hw/QPrMloJvLbkcWPQoLMB5hFVsiK5SXiguQ5Os1z4U5a3VLU6YivNKVbjcMJDo5s45Dbyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721886871; c=relaxed/simple;
	bh=gAZvwL67v0vt6xsxrH6XS/itsYUgy+inKlxURoSIcdU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OH3GluwRKq+Dfg3VVXE1U3e3lGUvYqK5c/GVTWr72uQ5O98SFMVt/8GNe3hUwoqojP5Adg98DQuybn8j4U+Hw0t6+g+RBNLzh3sZ/1Jl0wcO11MFCj9SOuv1M9VMTFm61odQFXfupJQFcnpF+OzSaSzA4S8HNvwKtO98ZwgHTzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RJ85KjAf; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721886867;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Dh3yyuBj9HXf2A5cEfYqf0NaFgetwfgWSnefr6wKli8=;
	b=RJ85KjAf4UFYaMoB7MfLRAe6rPY9kt8pF1qR5U2gIeIp/fZ0Ipe5OiwnQCuk7lAu/KeWIA
	ykfkZyj0bozUeTA0l1e5+di5A0gEnbbGyZlhe6njP+VILyRigXN8RwO+2J0MUfHlr3tbLg
	Qa5/THE0xENbwWa0lnH8R0i3QIADes0=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-422-UW02cR7lPbWJfq63E80L8w-1; Thu, 25 Jul 2024 01:54:25 -0400
X-MC-Unique: UW02cR7lPbWJfq63E80L8w-1
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-36835f6ebdcso420290f8f.1
        for <linux-rtc@vger.kernel.org>; Wed, 24 Jul 2024 22:54:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721886860; x=1722491660;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dh3yyuBj9HXf2A5cEfYqf0NaFgetwfgWSnefr6wKli8=;
        b=Un736tGqt/cNTzwh0pMcR/plCoDMr8scXkMydLZvjXgq74LL+TtAA9eypsR3/5a0eU
         y4+j5aY9f0/ThfoxKFNiz8hAqlSS71PzdB0CvOBkWkPqSuH32hZx2weYoTJJHzYJZolV
         bhDRgc3o4qc3gXsDZI+sTK8RXbCsXsvuB9IqDgEtUwUhwMlCDzqwOu5ZazYh7QlorC4e
         Rf6fXQKm6Ze1otaHAtF77DWu6Or3D/F8a0B4ghgcuYO9Jj+2JLFE71LOCJLJf9b5aM3c
         XorEvao0Q649HzXZFbAptMnAUpo96UcdnX8XRrxFstRWwTrhp1t0YdO6ldmttivTBOLI
         gC7w==
X-Forwarded-Encrypted: i=1; AJvYcCXVCSWVobZSC1g91YEsoe6lQ/n08qqIBdYUnVPhcDOQmovIYchnowZdua3yK3lUoXGGqbat3xepOJbSOuiw/pirQbt3pw0jOQjT
X-Gm-Message-State: AOJu0YyTHKuhteJT6/8IsQxYXWpjnh7fJzN/VQVsA9DZxQ7uJZU+8LJf
	Zld++PWKSDQDwTiHukOJ2QIdcinQFxYPT/fu6At6v8IUKVB/ONolTZucYpNieUCds4/P1yXSCrB
	O0jW1lSXyl+rcPz3gNiyaEKyCt0ro4gqvyCB8Lu1gq+nMrUmuGuxPDHpUQQ==
X-Received: by 2002:a05:6000:1942:b0:368:3038:8290 with SMTP id ffacd0b85a97d-36b36421ac8mr707599f8f.39.1721886860525;
        Wed, 24 Jul 2024 22:54:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHI3Abal444WmsilGMojUOB9llheQDVQUaMgG30HCOZkmwXntXo9Fy/JkeXGpR8m6xgr9AF9A==
X-Received: by 2002:a05:6000:1942:b0:368:3038:8290 with SMTP id ffacd0b85a97d-36b36421ac8mr707561f8f.39.1721886859582;
        Wed, 24 Jul 2024 22:54:19 -0700 (PDT)
Received: from redhat.com ([2a02:14f:1ed:8427:35e3:731c:3106:ee46])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36b36857dcesm900105f8f.85.2024.07.24.22.54.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jul 2024 22:54:18 -0700 (PDT)
Date: Thu, 25 Jul 2024 01:54:10 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Richard Cochran <richardcochran@gmail.com>,
	Peter Hilber <peter.hilber@opensynergy.com>,
	linux-kernel@vger.kernel.org, virtualization@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org,
	"Ridoux, Julien" <ridouxj@amazon.com>, virtio-dev@lists.linux.dev,
	"Luu, Ryan" <rluu@amazon.com>,
	"Chashper, David" <chashper@amazon.com>,
	"Mohamed Abuelfotoh, Hazem" <abuehaze@amazon.com>,
	"Christopher S . Hall" <christopher.s.hall@intel.com>,
	Jason Wang <jasowang@redhat.com>, John Stultz <jstultz@google.com>,
	netdev@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Marc Zyngier <maz@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Alessandro Zummo <a.zummo@towertech.it>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	qemu-devel <qemu-devel@nongnu.org>, Simon Horman <horms@kernel.org>
Subject: Re: [PATCH] ptp: Add vDSO-style vmclock support
Message-ID: <20240725015120-mutt-send-email-mst@kernel.org>
References: <14d1626bc9ddae9d8ad19d3c508538d10f5a8e44.camel@infradead.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <14d1626bc9ddae9d8ad19d3c508538d10f5a8e44.camel@infradead.org>

On Wed, Jul 24, 2024 at 06:16:37PM +0100, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> The vmclock "device" provides a shared memory region with precision clock
> information. By using shared memory, it is safe across Live Migration.
> 
> Like the KVM PTP clock, this can convert TSC-based cross timestamps into
> KVM clock values. Unlike the KVM PTP clock, it does so only when such is
> actually helpful.
> 
> The memory region of the device is also exposed to userspace so it can be
> read or memory mapped by application which need reliable notification of
> clock disruptions.
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>

one other thing worth mentioning is that this design can't work
with confidential computing setups. By comparison, mapping e.g. a
range in a PCI BAR would work for these setups.
Is there a reason this functionality is not interesting for
confidential VMs?

-- 
MST


