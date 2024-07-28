Return-Path: <linux-rtc+bounces-1630-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5241693E5D5
	for <lists+linux-rtc@lfdr.de>; Sun, 28 Jul 2024 17:24:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4DFE31C20900
	for <lists+linux-rtc@lfdr.de>; Sun, 28 Jul 2024 15:24:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70F5757CBA;
	Sun, 28 Jul 2024 15:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AXoaefxA"
X-Original-To: linux-rtc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0A6052F70
	for <linux-rtc@vger.kernel.org>; Sun, 28 Jul 2024 15:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722180246; cv=none; b=MO4q/cbhcLVN+qrHy+oWwzQKTH+N0WASo12RXgFSVcPWzmGOKQvRQTdVassbGGyeKBxL2F05awAVbHTq0hpcGVwPPoTT0t3xRCgX6rtnHxv4O94kEvAXQ4kGmIFEBdizhj5pDu3FXpfT07992xhOiWnOd2K/Vd1G4Q7PCVGIMjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722180246; c=relaxed/simple;
	bh=IOwAsnqgHoluJc7mNb67jddHNZA6RYbBXNw2KHo1ji0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nZWBkjUCPmwn4TUWjZrXMPRplN8X04nuc/k99WNB05cKuHV9ZA1CXtCr405jnMK0wwmWbdoTCoWgAbVJkXDPByfsIBa3kBFuG47oajb6jR0WLFvwwq9lf1TTs/xQmnhBGDMmVqSrklxaBrX12p75dCIqGpBkdxCQfJvc/QrMyXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AXoaefxA; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722180243;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5bC7CjlZdsdHI4lvHiT2ExOZBWJ7XMhmuhfoptCNZqw=;
	b=AXoaefxAA/fxfhwJuQdTKuwodTZY5oJJF9NUIjeQDKTHaLB6sQFPdm5hKVLdtJVg1FefQH
	zkdCL6lCfLH2g6HFoeQxD8VKloSmmv0s70739MXS6o9QO7+SNpw5Gz0lq799zI6gAx/O/O
	f3yxqmZxTxZoHH9C7QUCZUWKolX5g0Q=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-524-auxWGTzBNmS8vyqjSqBpQg-1; Sun, 28 Jul 2024 11:24:00 -0400
X-MC-Unique: auxWGTzBNmS8vyqjSqBpQg-1
Received: by mail-lf1-f72.google.com with SMTP id 2adb3069b0e04-52efd4afebeso3146029e87.2
        for <linux-rtc@vger.kernel.org>; Sun, 28 Jul 2024 08:24:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722180239; x=1722785039;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5bC7CjlZdsdHI4lvHiT2ExOZBWJ7XMhmuhfoptCNZqw=;
        b=BpGJX2GHDGtfWZmAm/xA+TcGfVOcjTd8c9vnY0QSyZpaXCnJ90msRp8yDZC7TgRsuz
         Iscwoxoa34I0T8TgrCbuyA5E6IXrGwPssgQWPcPW4JB1UJ7F39j3XgzBG6lAFa+qCSlU
         icDadLA2vAIbqFgtZooLx4qOGXD0FQbViWHCLCMYAGgzEU0ZwmzHSI2+s7KwVbz5fcu/
         mbt3IC0GpWEmJ0TUM2B1PioCifl73AcfoYVl4/2UMvvARB9FWaASerNsVdHJlINJJvp/
         EXvzl/jQmLNarTFxrwyscuElJF7lrEBO2zBgKM6ddPq+GA52j9mGChcoEILFe1RcbkqT
         rocQ==
X-Forwarded-Encrypted: i=1; AJvYcCUcTN0iZlbJ9GAZHLWU86WzFRPd0yZCszI2UiC0MNYSuftDm8EQMhzD4QqQPOvFRAceoGgKkW8zODRtl5nvqqoM2DBOFArsovqZ
X-Gm-Message-State: AOJu0YzvieEtWiAZcuUDnC+59rRl2gE9wLlavJDhG/1KRcTJKt8UXiZv
	W9LIOfaxwsuphrlUCp1uvXP3XU1f/o869AOWSOwGRkHc33wC7E5LHgK2x49RMlPkWvaryhA3lct
	IUQxMlWjF12jVMQeNO0FIlQbny14aFPKAR/qq+JFXm/7TMEIQem91DoYMFg==
X-Received: by 2002:a2e:be22:0:b0:2ef:1c0a:9b94 with SMTP id 38308e7fff4ca-2f12edfddc0mr34329541fa.16.1722180238926;
        Sun, 28 Jul 2024 08:23:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEU13tBt+N37F7ob3Jx0ruuvo8+dsNp9muZtzaqjHOl31gS3qTrnO0jECcjoxvWesNrjNQyHQ==
X-Received: by 2002:a2e:be22:0:b0:2ef:1c0a:9b94 with SMTP id 38308e7fff4ca-2f12edfddc0mr34329181fa.16.1722180238084;
        Sun, 28 Jul 2024 08:23:58 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc7:55d:98c4:742e:26be:b52d:dd54])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-428054b9196sm147521925e9.0.2024.07.28.08.23.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jul 2024 08:23:57 -0700 (PDT)
Date: Sun, 28 Jul 2024 11:23:49 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Richard Cochran <richardcochran@gmail.com>,
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
Message-ID: <20240728111746-mutt-send-email-mst@kernel.org>
References: <20240725081502-mutt-send-email-mst@kernel.org>
 <f55e6dfc4242d69eed465f26d6ad7719193309dc.camel@infradead.org>
 <20240725082828-mutt-send-email-mst@kernel.org>
 <db786be69aed3800f1aca71e8c4c2a6930e3bb0b.camel@infradead.org>
 <20240725083215-mutt-send-email-mst@kernel.org>
 <98813a70f6d3377d3a9d502fd175be97334fcc87.camel@infradead.org>
 <20240726174958.00007d10@Huawei.com>
 <811E8A25-3DBC-452D-B594-F9B7B0B61335@infradead.org>
 <20240728062521-mutt-send-email-mst@kernel.org>
 <9817300C-9280-4CC3-B9DB-37D24C8C20B5@infradead.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9817300C-9280-4CC3-B9DB-37D24C8C20B5@infradead.org>

On Sun, Jul 28, 2024 at 02:07:01PM +0100, David Woodhouse wrote:
> On 28 July 2024 11:37:04 BST, "Michael S. Tsirkin" <mst@redhat.com> wrote:
> >Glad you asked :)
> 
> Heh, I'm not sure I'm so glad. Did I mention I hate ACPI? Perhaps it's still not too late for me just to define a DT binding and use PRP0001 for it :)
> 
> >Long story short, QEMUVGID is indeed out of spec, but it works
> >both because of guest compatibility with ACPI 1.0, and because no one
> >much uses it.
> 
> 
> I think it's reasonable enough to follow that example and use AMZNVCLK (or QEMUVCLK, but there seems little point in both) then?

I'd stick to spec. If you like puns, QEMUC10C maybe?


