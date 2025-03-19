Return-Path: <linux-rtc+bounces-3551-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C9517A681A8
	for <lists+linux-rtc@lfdr.de>; Wed, 19 Mar 2025 01:43:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E570C7A87F0
	for <lists+linux-rtc@lfdr.de>; Wed, 19 Mar 2025 00:42:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A9455D477;
	Wed, 19 Mar 2025 00:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dn/s68Pq"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6F92A920;
	Wed, 19 Mar 2025 00:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742345006; cv=none; b=l7MD7IuxprY4xiEQLKlyIPAq3Fr2uuxD+yr1y7N6O4JrO2lfVqKIDdssdPD7JTihqNK6szT6vigTRQbS6GtrEaV7H2pdUPPPHZUsid5lRo6Mp5zVhhs5rdeGCI0yGB/t8v7r6rSW/8CVlab9w/EsNDeSVnP3w10HRBaB2414cnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742345006; c=relaxed/simple;
	bh=mHKnTpGJypIO/KKXW/RqTAv+6izqdI2BaKla/V7o8yA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TDTeEg+8l+HSSg6+H0kKTCKY7tfHQCEF2WWsYKpKHl4URcVZcyGU84FA1bn7nB3O4uyjPrhNSUoYnmJ8qD86ZP3cEnjs40dDNWlvEA6VkgTYb0qPs1j8lcWbRG8rVqg8Ehce5F35Fa+tOBQNIomGlpkkSg7ydx4zqhyl95gggaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dn/s68Pq; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7c0a159ded2so860028785a.0;
        Tue, 18 Mar 2025 17:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742345003; x=1742949803; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=109SVVi2V1KBVdBOfvc5rq7XvmKU466K1UBa3pW9LEk=;
        b=Dn/s68Pqf2sw5369+DlRudVuE+DLprgGqnk/oFj/uFkNR7Tizom/zh3fX55X2lVgKx
         IOFdFJMeRBoHFh9MpMBTEelnVfN4BC8Yq4+H0WKWIqeSTpi0vqzSEMSxWsod39y8Wj+i
         ieQFpPz9IFA9mCBnEVW1ykaMtseY77+WKUe3ZlfM8sE30PcgD9zolWk2rSSyA6DJzvhO
         /9wYcDVUCazOigCq0N1daBJu2X1HXpzUF2ro8ljU2ttJXfMoman61eUmk1WDGTAATO4G
         xcPf8c7NWh1rotVeUq0Q1M3H+7KmgV8H+Qk/1Gke0rH71UrBkE3xORKyWmsUVnXX8iy/
         YR8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742345003; x=1742949803;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=109SVVi2V1KBVdBOfvc5rq7XvmKU466K1UBa3pW9LEk=;
        b=Ek+0TojvIXt3zIoRERaEEfROYyFOT6yl5xoCEeWjJ5JBLgSCn2d1zlrc+Uiv1Wuvwd
         vlRKWkG51hbjN+4Gf6re45JvQuRgtkr9uGQ0puCLbLVssxDppKoATDVbBjVVFomqXYjs
         TZMs+hWFYA7R4d3ZrG6eYtcXH3A004EcbzQ+WI5xs+lYpUFqSoxRbaoG6ATWseOMt2kq
         y5AY85SOcgBf9ZAb1wxwyl10KTNdeE5NFZ2ToRNX2R4T1dGigPrOTck8N9El6MGhVNZ5
         eLEPZjpHVv8FEJjAgJf7SkRYtDiZWSDLzCq1YhrgLP03mgqRSxw0iJj3GXg9Ixevxx+f
         DE9A==
X-Forwarded-Encrypted: i=1; AJvYcCUJxvhSHdsbkZAHT/DVFk8RNQ7v3Bt4csG1FFN3aNDMvwVYOtXgD05o8VSLbP7z8BSLaMvSkFbFXsLS@vger.kernel.org, AJvYcCVh8enDCQ4wRF65/WfKgE9vX1LEC0M3eDtBWoIzC1El/D1LIWhuSyGRh2GDecocAwcy7KQbZNUTttGipDQH@vger.kernel.org, AJvYcCX8eXLQiJkrmMJGGGsL86+RHt7OYWuT8rjtrUYj6K7sGOX69v1zd2lkYW+0NXkVfekqIUToIicyEs34@vger.kernel.org
X-Gm-Message-State: AOJu0YyDfZ5mTdvAK2HnsvlXt+pm8tdf0Rbo0FGXVnKT4vmGoDUcWCam
	/e5i8ZZpdBRv6XFlopck1usqXtW05/oNluIUqr6wCEI4hPp7lb+Y
X-Gm-Gg: ASbGncskYjcnVD+qe2yI3TyhlVJPVG7yEiZEA5kVchaqJXqAn2Z0N6x4zSV5bCSY5IH
	AiQi8hFhw+EcEob6E9XOT3DxzKM7uM6JilMAyhDUZmYR/5NuWhqdUU9toPks9XPT+/MyB0gNDkG
	8O1fmIGH2gVFpJ0GmW7wguWYcUnE7XgezbaTeN83T8dnk6EQ18+K/bOsyR0OuS7WbxtzbNCGu39
	L14ORiB5F3pWm17kq5bO7g6DpolXZNnpiFwh5+kabHpqqco95Wltv7VQSQU4wz+3WVXrxH8prbJ
	0084u8hkmz3RWpqON5Qg7t2NpVLzu+o=
X-Google-Smtp-Source: AGHT+IGwPTO0H8oXf2WqT8+evCV+nYPdjITljtORgdkuJm4CD//Y9BewHl+yb7Q89eQYYTTDlZYDdw==
X-Received: by 2002:a05:620a:2a06:b0:7c5:9a6c:b7d3 with SMTP id af79cd13be357-7c5a845e479mr97122385a.37.1742345003657;
        Tue, 18 Mar 2025 17:43:23 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c573d72ceesm786534085a.66.2025.03.18.17.43.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 17:43:23 -0700 (PDT)
Date: Wed, 19 Mar 2025 08:43:07 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Chen Wang <unicorn_wang@outlook.com>, 
	Inochi Amaoto <inochiama@gmail.com>
Cc: Jingbao Qiu <qiujingbao.dlmu@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Arnd Bergmann <arnd@arndb.de>, Yangyu Chen <cyy@cyyself.name>, 
	linux-kernel@vger.kernel.org, Alexander Sverdlin <alexander.sverdlin@gmail.com>, 
	sophgo@lists.linux.dev, devicetree@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: Re: [PATCH v14 3/3] rtc: sophgo: add rtc support for Sophgo CV1800
 SoC
Message-ID: <gztsdu5p4tzt7emlwiuc3z74f4tfgkclcyrl324prqzp6dqhhf@ezrdmmhvf2nm>
References: <20250315224921.3627852-1-alexander.sverdlin@gmail.com>
 <20250315224921.3627852-4-alexander.sverdlin@gmail.com>
 <PN0PR01MB103935B34205CB22313838F34FED92@PN0PR01MB10393.INDPRD01.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PN0PR01MB103935B34205CB22313838F34FED92@PN0PR01MB10393.INDPRD01.PROD.OUTLOOK.COM>

On Wed, Mar 19, 2025 at 08:31:11AM +0800, Chen Wang wrote:
> Hi, Inochi,
> 
> I see Alexander add "drivers/rtc/rtc-cv1800.c" in "SOPHGO DEVICETREES and
> DRIVERS" of MAINTAINERS, would you like to take this?
> 
> Regards,
> 
> Chen
> 

If it is not covered by our entry. It is fine for me to take it.

Regards,
Inochi

