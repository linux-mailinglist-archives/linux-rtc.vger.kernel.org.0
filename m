Return-Path: <linux-rtc+bounces-4306-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 20290ADDF83
	for <lists+linux-rtc@lfdr.de>; Wed, 18 Jun 2025 01:19:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 553FA1885D49
	for <lists+linux-rtc@lfdr.de>; Tue, 17 Jun 2025 23:20:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 154AF298982;
	Tue, 17 Jun 2025 23:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OUmhq80p"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D28B295D85;
	Tue, 17 Jun 2025 23:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750202391; cv=none; b=Bvj+WIuOakfI9eNVlNRnyJHAwnkac4WlZbkh75xwTx3r/UC1uk+p2ll7POdh00zD++q4PLF14gSAasVlK3xiZWOsxQgHsU7bd6PHVRZulXKa4RetSu2mFyEhxi/8NBWtWYy5MEkr1oDG8SxOzbnzGvThJymNpQrlA7CZ55CBmU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750202391; c=relaxed/simple;
	bh=72RiHssNvDFQJNQq4LIcMB+q+Uc4lLwzNNUsDHHaPag=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cESDcWhSvygWSHNC/DCYRSg4YmXynRCJ8UbHV0Ps7TuDa+8qF2VxQaJgeKFFdRs9WDV719BNA9UN7lIP7HqFc0IeJzt/1778JYJ1gTu46ovianGPFYa3shEbq10Dp+B6W/oYO3QP3H0O4Ft/fgnHXwRx7KluMV/yAT6XSfscGJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OUmhq80p; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-23602481460so61731955ad.0;
        Tue, 17 Jun 2025 16:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750202390; x=1750807190; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=c8kqTpESSgpiUk9q9r1gwFAkl1Q36FcCmMv3qMR5ZJs=;
        b=OUmhq80pZFqs0MbizXnBpqzixTOei6T/+6Dw2b6/SH1TKjqPCF+X0RBqs+JybuGefO
         jAUuOE/3Oy1Rj03HdTRe06uyQ/icyKfnvzoIzecTh53z9NQ8jaJighs+j0CXdGc1zD8B
         HuTP9MFfMWgc4wWgF0YOScTg9CLFbGswU+7gKteVdWHRRQ+tKRHofJymhsbTCsBQYV2g
         uzRinzKzrNnAevquhcsnnuZ9/M0QzKtMMIarMzh/kNvfWIzc0crxRBI2UTw+qwsmEO07
         DSFdnsFfIdXZZgfGglRWL78nge50de/W6b1RpNxRbfkrLzR+sNGWfTjqBo5WzT723w+r
         SAwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750202390; x=1750807190;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c8kqTpESSgpiUk9q9r1gwFAkl1Q36FcCmMv3qMR5ZJs=;
        b=Rw9CSdkbKzuM2GRUXMOdnzH6zho4eEi6gV/fNKNyBSTgoQBa+4/BuEc39iO8KdRuTw
         or7SlpKvwaRu+F1qZbdS1ftVgtApcG0pekSgOavkpoMNen+6t+IJLxlp0LXf1Np50Fah
         MnxgpgwHuEXFIYEGzMpmro5k/ilx3uVbp8H9Nqc13N0AD0UnkqgcFPZ5IoZET4yJcazK
         HQM3U9IJ8sRlHcp9vlgIQ3/8IdjWpk1+RRWwQCAIiE1roOEQLXF91gThRDzW1ZYC+Y4h
         5aXY03DY/W/tdOIJZi0Ir1R53nn7LTY/HSeg9dKe4AxEDMTmHrpfMFya07mRpo3S9anO
         oVPw==
X-Forwarded-Encrypted: i=1; AJvYcCUMNjzHheEE3Vgh8p+bOBPcdwuS/2Kt+vZacRC4V9jsReFLKSVu5mKccluvQ4+dFEQsCEZAnCGTutHv@vger.kernel.org, AJvYcCUoZ6FCTse48JDcn7DE+gYiJ9YH17CjhCk1xfqgf7m2BhmMlN5Q2ln8KUNjCZGtZpgOfrAzVW5tsKYhIVnc@vger.kernel.org, AJvYcCVjXKBa4HPR97w3ZmO7uK9slD6j+h6W13j5UpZYQoozK4BhFmOcUHL89v0RcQaGcg4bZ8urjResBT4P@vger.kernel.org
X-Gm-Message-State: AOJu0YyZ5ApPoUl+44P9547TzPU7Qxik/aM+a4IAZcfYn/aDWNnFFKJe
	5JcjA9g9J0u14Pe4vrLDinbH2n1+Kn05tGwn0ZZcFiKG0H+mFnad9Alb
X-Gm-Gg: ASbGnctRsPGcf7ufaQORvMk97PaecsxKLfyzUdrf618KE/Jf1t7kBygXhdWfLXT1TbY
	n/RZcx2IVCUuKNAXVf1QsDZiMFkfM1UH1DQ1hDF1mgJ7jI1khd709Ne47yHG5+V45Otma5TNxY8
	boNGhyLFtHu4PX708Q76ZM4xIt/VeQ3A5blIexpqK8kqpjPpSPvwzz6uHrBN5NV/qiZZJCPRIQz
	Ajx6vP8GTz6YrE8T+F+++7IT80WSuxjZS+hXl1Ac6YSqOx9JeniSBZxWVXkdULbeGa5dZEmyTQz
	j6y58Id2ncpwF4JTO9J5jRrXFBJNDD12pzacZrFu2a8ocrKtVtNQnYhOodGNjg==
X-Google-Smtp-Source: AGHT+IHnlTzH8mh8gEyI3HuM9I4iPM9eqDaoTtYmvsv4BhKj8WV44E0nTVYmDn94/Ci0M7hmdQfhAg==
X-Received: by 2002:a17:902:f68e:b0:234:cf24:3be8 with SMTP id d9443c01a7336-2366b12f541mr253789605ad.28.1750202389638;
        Tue, 17 Jun 2025 16:19:49 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-2365d88c239sm86423235ad.11.2025.06.17.16.19.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 16:19:49 -0700 (PDT)
Date: Wed, 18 Jun 2025 07:18:32 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>, Inochi Amaoto <inochiama@gmail.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, sophgo@lists.linux.dev, Jingbao Qiu <qiujingbao.dlmu@gmail.com>, 
	Alexander Sverdlin <alexander.sverdlin@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: Move sophgo,cv1800b-rtc to rtc directory
Message-ID: <mig7k5zyhmata6uvjwlwlompwf22qffwvma2nhjww3cmsmxnas@y2t5ukucs76q>
References: <20250608224252.3902421-1-robh@kernel.org>
 <ywln42bb3i5hyzlsmfbx3xt2kjbefqmcxytcqxdcgah77gcesi@2cdw3cgxbg4c>
 <20250617130924.GA1678432-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250617130924.GA1678432-robh@kernel.org>

On Tue, Jun 17, 2025 at 08:09:24AM -0500, Rob Herring wrote:
> On Mon, Jun 09, 2025 at 06:49:38AM +0800, Inochi Amaoto wrote:
> > On Sun, Jun 08, 2025 at 05:42:51PM -0500, Rob Herring (Arm) wrote:
> > > The $id path for the sophgo,cv1800b-rtc binding was missing part of the
> > > path 'soc'. However, the correct place for RTC bindings (even if it's
> > > also a "syscon") is the rtc directory, so move the binding there while
> > > fixing the $id value.
> > > 
> > > Fixes: 76517429dbfd ("dt-bindings: soc: sophgo: add RTC support for Sophgo CV1800 series")
> > > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> > > ---
> > >  .../bindings/{soc/sophgo => rtc}/sophgo,cv1800b-rtc.yaml        | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >  rename Documentation/devicetree/bindings/{soc/sophgo => rtc}/sophgo,cv1800b-rtc.yaml (96%)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800b-rtc.yaml b/Documentation/devicetree/bindings/rtc/sophgo,cv1800b-rtc.yaml
> > > similarity index 96%
> > > rename from Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800b-rtc.yaml
> > > rename to Documentation/devicetree/bindings/rtc/sophgo,cv1800b-rtc.yaml
> > > index 5cf186c396c9..c695d2ff9fcc 100644
> > > --- a/Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800b-rtc.yaml
> > > +++ b/Documentation/devicetree/bindings/rtc/sophgo,cv1800b-rtc.yaml
> > > @@ -1,7 +1,7 @@
> > >  # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > >  %YAML 1.2
> > >  ---
> > > -$id: http://devicetree.org/schemas/sophgo/sophgo,cv1800b-rtc.yaml#
> > > +$id: http://devicetree.org/schemas/rtc/sophgo,cv1800b-rtc.yaml#
> > >  $schema: http://devicetree.org/meta-schemas/core.yaml#
> > >  
> > >  title: Real Time Clock of the Sophgo CV1800 SoC
> > > -- 
> > > 2.47.2
> > > 
> > 
> > As the rtc syscon has a sub function for remoteproc, is it proper to
> > move this binding into rtc subsystem?
> 
> Does that affect the binding (is there more to add)? Looks like an RTC 
> from the binding.
> 

I think at least "resets" property may be added for the this, but I am
not sure whether there will be more.

Regards,
Inochi

