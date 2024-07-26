Return-Path: <linux-rtc+bounces-1608-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB55793D368
	for <lists+linux-rtc@lfdr.de>; Fri, 26 Jul 2024 14:47:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 92F3F28406A
	for <lists+linux-rtc@lfdr.de>; Fri, 26 Jul 2024 12:47:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DF9C17B515;
	Fri, 26 Jul 2024 12:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="N7yDkRFW"
X-Original-To: linux-rtc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88A2B17B43E
	for <linux-rtc@vger.kernel.org>; Fri, 26 Jul 2024 12:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721998044; cv=none; b=c4/HzukC1BG5roFi83X80NJdXZPcgLpVjyhzuAy0iPi0Y+lGB3Baeyw48zfY0E5xcQv7WBQr0q8JaoPZK9/3BBf4/trF4aUgMIA/fu4L16nvWaeynzBaIbABfxg5+HJS5Wtj5wvk903/ZwdtYVznF8Jf4uLz/F9ZfNDZlCXYoFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721998044; c=relaxed/simple;
	bh=RmGLUnoetEsANs8js7zdCDASNKY2oahCjcFGORl2aJU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jwyd7yK80etAo1/7/WkysiW7FwpQY6XSSOgO3jR2/tmwk3136l7tUJwHKE3ra+jX/I0RiGElA1NeJ8P5qCB/9f+7hjy87Xne999XiQ/NPX+5JZ8OZGU67BETNzGn6Ypjj9QTOB/KSmaeyXPUAP34CitL3yyxADf1syPzsMq5uQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=N7yDkRFW; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721998041;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+RI/VaWGAXgOj4f2LRD8sZvA9wQ8Bbq5V+URVVIVY/U=;
	b=N7yDkRFWuv0bLh5CTIDunfj0uQrc1w5ezA4WuEvwcxcliqVglBwRMSUDiURF1u/V6k5Yx9
	1y5/q6DKMG/LoeABVXD+c+9Wqo0xHYNFXWoq8Elhgvfjq2Z7J240fyE4P0OzhnyM3Zgql4
	vwgaVvz3J3evU9Try6yWkpgkfdYtQXI=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-194-dphR30VZOvuB5pxd3rXs0g-1; Fri, 26 Jul 2024 08:47:20 -0400
X-MC-Unique: dphR30VZOvuB5pxd3rXs0g-1
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-36873a449dfso1559982f8f.0
        for <linux-rtc@vger.kernel.org>; Fri, 26 Jul 2024 05:47:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721998039; x=1722602839;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+RI/VaWGAXgOj4f2LRD8sZvA9wQ8Bbq5V+URVVIVY/U=;
        b=Yeo8qlPWWNcBKd2e+6i7MMHnC6R3PDW33WPvIhW4ZGrbWoUG1XvymCDOdWWO55fVlL
         joXX/zofXi0eE6kru+HWxx45ORfSxN5pKapi2yAs9JBAFegvqJjXirr3K2ts/vdjzN5E
         +MI7CGdVS5Xsuo1d/FXspmtrjxpK1bFLOOELo3FpYzFMXBGvUQkW2cS2HKMCurGFxQZ9
         5hFOuQmbVJGgFZwNSgdf9+mGgWnbSSQbHN8fLiRQ6vD85mxalrjqhfe97F+KxzEUSDIg
         0o9Os+oZ5Xz576/F9HPq2OkmPYGDdDc0DXpdHEm624bvYWuYWzvx1UZstOjuyIjpScVR
         swNw==
X-Forwarded-Encrypted: i=1; AJvYcCURpQSBX++EmPGs8URkpt61Ir31n7u2+0KbTetsfaZwMenMjq4BMcdsJa81qis5JxQc2WxxJpi9sxu8LQOgdOH6T4xwQ7BQ/doq
X-Gm-Message-State: AOJu0Yys4qBuFun2dijJKg82cClsuWmhp8V79tnMEeakYTx6D2Iq4EmW
	UhLu0P4DaOXNsUWjFCo054A+RUei65xRNU8Xv+MrOxRTYMLyYmFqgcEXJ4Y5pyJq0UZZ+E+M3iy
	w9T8af2gOw9aGHAxVvVH8OYq8CXpk8YSOFDD1b2L1fx8OIRR3plrcmRCV/g==
X-Received: by 2002:adf:f802:0:b0:367:40b6:b90b with SMTP id ffacd0b85a97d-369f66a36dcmr6227099f8f.10.1721998039090;
        Fri, 26 Jul 2024 05:47:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHDA1wA77VLVH0wQPd6DrvSmW8M/g+xgdd7FFO6J646GDTZZ94nA7gUMdnSx1MXbGPQ+LmlFw==
X-Received: by 2002:adf:f802:0:b0:367:40b6:b90b with SMTP id ffacd0b85a97d-369f66a36dcmr6227065f8f.10.1721998038420;
        Fri, 26 Jul 2024 05:47:18 -0700 (PDT)
Received: from redhat.com ([2a02:14f:1f7:28ce:f21a:7e1e:6a9:f708])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36b367d98ccsm5031156f8f.33.2024.07.26.05.47.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jul 2024 05:47:17 -0700 (PDT)
Date: Fri, 26 Jul 2024 08:47:13 -0400
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
Message-ID: <20240726084424-mutt-send-email-mst@kernel.org>
References: <2a27205bfc61e19355d360f428a98e2338ff68c3.camel@infradead.org>
 <20240725122603-mutt-send-email-mst@kernel.org>
 <0959390cad71b451dc19e5f9396d3f4fdb8fd46f.camel@infradead.org>
 <20240725163843-mutt-send-email-mst@kernel.org>
 <d62925d94a28b4f8e07d14c1639023f3b78b0769.camel@infradead.org>
 <20240725170328-mutt-send-email-mst@kernel.org>
 <c5a48c032a2788ecd98bbcec71f6f3fb0fb65e8c.camel@infradead.org>
 <20240726010511-mutt-send-email-mst@kernel.org>
 <20240726012933-mutt-send-email-mst@kernel.org>
 <f2e85f8f568f8a21b2178e59d8387d7a52a843bd.camel@infradead.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f2e85f8f568f8a21b2178e59d8387d7a52a843bd.camel@infradead.org>

On Fri, Jul 26, 2024 at 09:06:29AM +0100, David Woodhouse wrote:
> That's great. You don't even need it to be per-vCPU if you let the
> hypervisor write directly to the single physical location that's mapped
> to userspace. It can do that before it even starts *running* the vCPUs
> after migration. It's a whole lot simpler. 

It *seems* simpler, until you realize that there is no way
to change anything in the interface, there is no negotiation
between hypervisor and userspace. If I learned anything at all
in tens of years working on software, it's that it is
never done. So let's have userspace talk to the kernel
and have kernel talk to the devices, please. There's
no compelling reason to have this bypass here.

-- 
MST


