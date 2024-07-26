Return-Path: <linux-rtc+bounces-1603-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F05E093CDD3
	for <lists+linux-rtc@lfdr.de>; Fri, 26 Jul 2024 07:56:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7DA151F2300F
	for <lists+linux-rtc@lfdr.de>; Fri, 26 Jul 2024 05:56:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DD8A15667E;
	Fri, 26 Jul 2024 05:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="e1Te7lWn"
X-Original-To: linux-rtc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 582BF156676
	for <linux-rtc@vger.kernel.org>; Fri, 26 Jul 2024 05:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721973357; cv=none; b=MMH8tLgpdP5iZgmNeb9lia669BBPAYSuDzYGMOkjN4yvhZaLBFseni138OuqHWIOD5zy5x1ur+Q+P7G1OWbrVx3Ux2UC5YWRRwttDekl/gBS92sehieaY8gsNMuG9N0S/zIfbxDSqu9VAA1L8riyt+Eq98ZVJWSPuPggJHMzt0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721973357; c=relaxed/simple;
	bh=fkYfLB7BkpI4W3EQOlvtcDUJr9taWUaCe/cQpnY7uc8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S2vfwZlY8JbaB1D6A3pRV1/cx1hF5EI1kBlPD+fKcdtzEZaKchc1PoCHFSAqrX7nYuF+FebCufX926SSNWj7b+vl58DxFDZtvHUlEOQcR4YTnhUNgoLaT2BwXm9xAjDScAW6rw2aiKnXFrbbhSeqy9WqJoJ8xaNL8GKA35rG0Ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=e1Te7lWn; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721973354;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YQThcy6xed9kn8EJsXisAuikWbZtGIN23SlH2PNZkcA=;
	b=e1Te7lWn/sdLgdUQ1fEX0vdHcLlV0BWzR3f6Uk7ZI/V8Zc6lT1Dh16H7WqZfJ7jQySt8li
	FlIEY4VQL3DtX+Xh5xtY3JZf3vfrgRp7dArX5E5XEa+FMiQgRq66qYaNkaCV5Isd6CUxDo
	tK85QSt8yNWc1jMkyFM1XjVJcCy5GCE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-536-DSbMWFmuN06HXZuzU-RohA-1; Fri, 26 Jul 2024 01:55:52 -0400
X-MC-Unique: DSbMWFmuN06HXZuzU-RohA-1
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-42668796626so12875985e9.0
        for <linux-rtc@vger.kernel.org>; Thu, 25 Jul 2024 22:55:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721973351; x=1722578151;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YQThcy6xed9kn8EJsXisAuikWbZtGIN23SlH2PNZkcA=;
        b=CU2x+RbYRWLI+G1j0mzRHHUNfPKyxXOhf/WDGolCex0jR3D8oJ0UKS8zY7qT6fq/Ci
         dnR5ct3V9NzdfDMj3ZTIrsQDKY6J/UvqUU/Z0EhZdF+KATpA/DUJKMuyz/z8Goohox/y
         ACeot9zIunvyGqMQ+pr2D+zefYjzFF6+zUYdUXGfAXNVkeDOt1hlM/T/DOSmsKfA63cu
         lRPH8nYlr+G3RRlMQe0Ei5z9+heptc1pgxden4J1N9QOyQqDeLkBUKGKqG6pjYHi3PR3
         0u8H8K4QN6543ydApg5OMyAVSfQ0SRgJNUnLjrgzgh+sAvlc7rB2RS07c/g7e8JhcHFa
         CUKg==
X-Forwarded-Encrypted: i=1; AJvYcCVmyvYY4cqvdf1MvP8HC0o/YtGqvpxgK8G8F4nZ/ghMXWvLjNfQZZ7v3SB3o0Y7xHEd9lear0vshyBYkstYBqDmsDiT8tUmPaMk
X-Gm-Message-State: AOJu0YzJCavHglEyHnzl9HHeX0czwgtj44od0sJbm/SkRiLYrM08z23+
	jpyFlwhAfsL8x34EMV/7beXzsLDx7kew6VuFsNHxwLNBFOW8yTMCC8FUqQkK2b+qBbVyZT4Gfo4
	X0Rf6pW/6c2uU203ws19//CVCA39EeYbfxze1JeND867V4LSq2l+/xIe+yA==
X-Received: by 2002:adf:c08b:0:b0:367:8875:dd4c with SMTP id ffacd0b85a97d-36b31ae2541mr2973093f8f.23.1721973351678;
        Thu, 25 Jul 2024 22:55:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGwUk9Ft0dVUiNjmu7f1QTIXu6q3o+g6VMlVMK1lSks1buGboeYtzHjiLlkzq1mSCBI88a7sA==
X-Received: by 2002:adf:c08b:0:b0:367:8875:dd4c with SMTP id ffacd0b85a97d-36b31ae2541mr2973059f8f.23.1721973351027;
        Thu, 25 Jul 2024 22:55:51 -0700 (PDT)
Received: from redhat.com ([2a02:14f:1f7:28ce:f21a:7e1e:6a9:f708])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4280573edbfsm63673365e9.15.2024.07.25.22.55.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jul 2024 22:55:50 -0700 (PDT)
Date: Fri, 26 Jul 2024 01:55:45 -0400
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
Message-ID: <20240726012933-mutt-send-email-mst@kernel.org>
References: <98813a70f6d3377d3a9d502fd175be97334fcc87.camel@infradead.org>
 <20240725100351-mutt-send-email-mst@kernel.org>
 <2a27205bfc61e19355d360f428a98e2338ff68c3.camel@infradead.org>
 <20240725122603-mutt-send-email-mst@kernel.org>
 <0959390cad71b451dc19e5f9396d3f4fdb8fd46f.camel@infradead.org>
 <20240725163843-mutt-send-email-mst@kernel.org>
 <d62925d94a28b4f8e07d14c1639023f3b78b0769.camel@infradead.org>
 <20240725170328-mutt-send-email-mst@kernel.org>
 <c5a48c032a2788ecd98bbcec71f6f3fb0fb65e8c.camel@infradead.org>
 <20240726010511-mutt-send-email-mst@kernel.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240726010511-mutt-send-email-mst@kernel.org>

On Fri, Jul 26, 2024 at 01:09:24AM -0400, Michael S. Tsirkin wrote:
> On Thu, Jul 25, 2024 at 10:29:18PM +0100, David Woodhouse wrote:
> > > > > Then can't we fix it by interrupting all CPUs right after LM?
> > > > > 
> > > > > To me that seems like a cleaner approach - we then compartmentalize
> > > > > the ABI issue - kernel has its own ABI against userspace,
> > > > > devices have their own ABI against kernel.
> > > > > It'd mean we need a way to detect that interrupt was sent,
> > > > > maybe yet another counter inside that structure.
> > > > > 
> > > > > WDYT?
> > > > > 
> > > > > By the way the same idea would work for snapshots -
> > > > > some people wanted to expose that info to userspace, too.
> > 
> > Those people included me. I wanted to interrupt all the vCPUs, even the
> > ones which were in userspace at the moment of migration, and have the
> > kernel deal with passing it on to userspace via a different ABI.
> > 
> > It ends up being complex and intricate, and requiring a lot of new
> > kernel and userspace support. I gave up on it in the end for snapshots,
> > and didn't go there again for this.
> 
> Maybe become you insist on using ACPI?
> I see a fairly simple way to do it. For example, with virtio:
> 
> one vq per CPU, with a single outstanding buffer,
> callback copies from the buffer into the userspace
> visible memory.
> 
> Want me to show you the code?

Couldn't resist, so I wrote a bit of this code.
Fundamentally, we keep a copy of the hypervisor abi
in the device:

struct virtclk_info *vci {
	struct vmclock_abi abi;
};

each vq will has its own copy:

struct virtqueue_info {
	struct scatterlist sg[];
	struct vmclock_abi abi;
}

we add it during probe:
        sg_init_one(vqi->sg, &vqi->abi, sizeof(vqi->abi));
	virtqueue_add_inbuf(vq,
                        vqi->sg, 1,
                        &vq->vabi,
                        GFP_ATOMIC);



We set the affinity for each vq:

       for (i = 0; i < num_online_cpus(); i++)
               virtqueue_set_affinity(vi->vq[i], i);

(virtio net does it, and it handles cpu hotplug as well)

each vq callback would do:

static void vmclock_cb(struct virtqueue *vq)
{
        struct virtclk_info *vci = vq->vdev->priv;
        struct virtqueue_info *vqi = vq->priv;
	void *buf;
        unsigned int len;

	buf = virtqueue_get_buf(vq, &len);
	if (!buf)
		return;

	BUG_ON(buf != &vq->abi);

	spin_lock(vci->lock);
	if (memcmp(&vci->abi, &vqi->abi, sizeof(vqi->abi))) {
		memcpy(&vci->abi, &vqi->abi, sizeof(vqi->abi));
	}

	/* Update the userspace visible structure now */
	.....

	/* Re-add the buffer */
	virtqueue_add_inbuf(vq,
                        vqi->sg, 1,
                        &vqi->abi,
                        GFP_ATOMIC);

	spin_unlock(vi->lock);
}

That's it!
Where's the problem here?

-- 
MST


