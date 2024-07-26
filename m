Return-Path: <linux-rtc+bounces-1604-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5220093CDF2
	for <lists+linux-rtc@lfdr.de>; Fri, 26 Jul 2024 08:06:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4EF8E1C20CD2
	for <lists+linux-rtc@lfdr.de>; Fri, 26 Jul 2024 06:06:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68A55174EE7;
	Fri, 26 Jul 2024 06:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KI9s9kfq"
X-Original-To: linux-rtc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D916317334E
	for <linux-rtc@vger.kernel.org>; Fri, 26 Jul 2024 06:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721973988; cv=none; b=gaBTefEObE3DGG587ISGrWrFB6gsNp/dgQAGJBXgNA7ouM9yiNyhb3TgkKsfLG9dj9ZZ+HFcTECXlvBoTl6l7BjhWPPi0tFhYqvVDnJIGGDPSVk7MqGZ/rDNG47DSowv21q5507ZBJmMYt0SNLoWTpa6IQVCT1jf7lLgyW+Ytd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721973988; c=relaxed/simple;
	bh=6a7x76ue8Tb/QiSBhzrn7bO0FzEBds6B8ZU9VxKhPik=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=asWl5VSCU3wkVqpK/d4wxjs+3ln/Fg6hsJh5FLffA/bjfiFpYBojghVLpJu1LxHtwf2Ukvr2lR2MOqRIH1NV+ix10ONWeTHqBGYTyiZiEeeepwlZaiDUZoopja8LRqKKmHitYQFHAGEN+A6MZ4XMV10dNTsIiyu7v72mnbmPq80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KI9s9kfq; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721973985;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SsMd5ReUoNivIVt7CipMVyDPULIY2oYNW6l4qiM7rgQ=;
	b=KI9s9kfq78/gvr5zC6Ormvt+28n1pba2r78xX/StLGt7sWJeTAGo1ZlRxfhDHbD+mqNZiF
	JPnGezZqD0NI+wtHNlIzZX4VkN68+KLu0MMyY4SPJjpFppQ9Fylw4ws8bW6kqbrH7ddYeA
	qMBPcFRyXSfOD+cJzdxr5Bm2CYSb+Ws=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-453-SxMJnoB-NJSKWhT1tV-7bw-1; Fri, 26 Jul 2024 02:06:21 -0400
X-MC-Unique: SxMJnoB-NJSKWhT1tV-7bw-1
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-367962f0cb0so956061f8f.1
        for <linux-rtc@vger.kernel.org>; Thu, 25 Jul 2024 23:06:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721973980; x=1722578780;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SsMd5ReUoNivIVt7CipMVyDPULIY2oYNW6l4qiM7rgQ=;
        b=nonyM7JV4GoBwl4bGrUgaryM2E1Ip7hKRB0l2t4tpG/ERRmQTsPxOLAKgXAn5o4egH
         C3YYJIhwA0iJKZWnsMcZs58c+n0yxG+FoPMNPNwp3WITX+QTKIEq6tb5RnN0zF9DOkLf
         4r4dJL4z02/lrQSihqFIBlv2QSkQYPDJIL3MGFGVngoduQNjKj1J9V+IjS5PjcE/neT3
         cnrfFrOV2eWDqAP1Xy3Q1hWG/LijTlwYg9nvqYs5imiPG6A2kATKxuEK2eJn2rWPfrJg
         nSO+wYQnwovvZoj/EU0WpOEPM6FAqKLxXv6xXmMcIFXVAyEwLiw8i91isLyfcSFrOL9t
         y0yg==
X-Forwarded-Encrypted: i=1; AJvYcCVL0yblSrYuLlFfJKBgutoYnOe8bRnghRBXg82KrN2HISB+ytSr4T0f3S2U4lr/2wN3NPtKTpiGkjUeI8OuKUwA1lXw6C0Rsimi
X-Gm-Message-State: AOJu0YwDPDCYnbosQKQGZqCIKKc7jwSukCKUp0qmkZmgEcUripjsru3k
	ohfsEjHiaRNU0WgapmLtx7Opbue3lCN+Elz5rAvgcSG++ufKW1q+01+KEQmiEZQnogtfkc6+7Sc
	/2QdYvtCYKs5fLz1BhMG1DfNz9/hjIfIK9N5ObkhK2u+IF6OO6fatzZqv2A==
X-Received: by 2002:adf:e3d0:0:b0:368:3731:1614 with SMTP id ffacd0b85a97d-36b3639c90cmr2555962f8f.32.1721973980465;
        Thu, 25 Jul 2024 23:06:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IECcqinn2RbOzn7J7peOWcha9uEPwJVbe5Fk8jNLudEw/NhTNHYXX4sldsTgb73GWvF/16VyA==
X-Received: by 2002:adf:e3d0:0:b0:368:3731:1614 with SMTP id ffacd0b85a97d-36b3639c90cmr2555913f8f.32.1721973979719;
        Thu, 25 Jul 2024 23:06:19 -0700 (PDT)
Received: from redhat.com ([2a02:14f:1f7:28ce:f21a:7e1e:6a9:f708])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36b36863aa7sm4031338f8f.109.2024.07.25.23.06.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jul 2024 23:06:19 -0700 (PDT)
Date: Fri, 26 Jul 2024 02:06:10 -0400
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
Message-ID: <20240726015613-mutt-send-email-mst@kernel.org>
References: <20240725100351-mutt-send-email-mst@kernel.org>
 <2a27205bfc61e19355d360f428a98e2338ff68c3.camel@infradead.org>
 <20240725122603-mutt-send-email-mst@kernel.org>
 <0959390cad71b451dc19e5f9396d3f4fdb8fd46f.camel@infradead.org>
 <20240725163843-mutt-send-email-mst@kernel.org>
 <d62925d94a28b4f8e07d14c1639023f3b78b0769.camel@infradead.org>
 <20240725170328-mutt-send-email-mst@kernel.org>
 <c5a48c032a2788ecd98bbcec71f6f3fb0fb65e8c.camel@infradead.org>
 <20240725174327-mutt-send-email-mst@kernel.org>
 <9261e393083bcd151a017a5af3345a1364b3e0f3.camel@infradead.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9261e393083bcd151a017a5af3345a1364b3e0f3.camel@infradead.org>

On Thu, Jul 25, 2024 at 11:20:56PM +0100, David Woodhouse wrote:
> We're rolling out the AMZNVCLK device for internal use cases, and plan
> to add it in public instances some time later.

Let's be real. If amazon does something in its own hypervisor, and the
only way to use that is to expose the interface to userspace, there is
very little the linux community can do.  Moreover, userspace will be
written to this ABI, and be locked in to the specific hypervisor. It
might be a win for amazon short term but long term you will want to
extend things and it will be a mess.

So I feel you have chosen ACPI badly.  It just does not have the APIs
that you need. Virtio does, and would not create a userpspace lock-in
to a specific hypervisor. It's not really virtio specific either,
you can write a bare pci device with a BAR and a bunch of msix
vectors and it will get you the same effect.

-- 
MST


