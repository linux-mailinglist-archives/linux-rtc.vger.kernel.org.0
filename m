Return-Path: <linux-rtc+bounces-1780-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 18C8F96590C
	for <lists+linux-rtc@lfdr.de>; Fri, 30 Aug 2024 09:49:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4BA731C2122E
	for <lists+linux-rtc@lfdr.de>; Fri, 30 Aug 2024 07:49:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C928C158544;
	Fri, 30 Aug 2024 07:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Noa8Jlhr"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C4B212F59C;
	Fri, 30 Aug 2024 07:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725004137; cv=none; b=FOZcJbeHiCmCzSUfDnYtB1FCwLOjvGTT2OJTIxCtdzZvhecIt3U1GBBi+wh+5Kzs0+Tz+hXHIq8vMGgUuyePSAsYMKYyfLuXpxIQSIy7jRdaYhtiE6si9to0Hb7mQehlmOR7oLk9Dz0D8tZkJbWyff+gRgtF+/0gYsuf656dvP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725004137; c=relaxed/simple;
	bh=8Kwc+fPOBTDhoAeV+ipJ0AAdf/6JxEH3zyZybp6vuGY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EfUMAoc5wR/02YY1bLz6O9qxcjMMfvD4nVBUc4rN85ntgJ8IFUaIfSWF6evjTa29ztVgVlLUpWMg59HfQY8aoNQx6XKKMzWFe9vS8HfVwmFu99pci8AbtNtnHM1LVlZTPzUuWA5B5xgVcR5MZ1Zeb2PqCIaqoj5jZbPDKbGNr4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Noa8Jlhr; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-371936541caso951344f8f.0;
        Fri, 30 Aug 2024 00:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725004134; x=1725608934; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8Kwc+fPOBTDhoAeV+ipJ0AAdf/6JxEH3zyZybp6vuGY=;
        b=Noa8JlhryR+69xNmOmlP8VjfTm5p4Y9dw8Z0e8X8s7imLia1RlPyS/ECiPkeNiblrm
         qOZLgOOBVnpV51o/d8UZ02JjVVIc01J5Oc0vgbHlybGfmbuvZHLWQzxpSuu6LURqsycM
         VQ5hArHxcrtIXT4xfQNLG70qnCg0vJ/1tB08ZqvIteKOm7802K9a8c0gpw/CmuPlWaI1
         sOuBDHy0HaGtMp6BVAIRVbBzp2/t2iT6umrU2Q/x3hBiwhuHMHtwZ2ZXqRYjy4Dpj3Zp
         Of1oHcatMv4w2Yh9fqzvgeYpwxs2spgeLdz23L0isosPWafnv8eiefBkVG4PHsGdPLop
         t8eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725004134; x=1725608934;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8Kwc+fPOBTDhoAeV+ipJ0AAdf/6JxEH3zyZybp6vuGY=;
        b=H0kYGi1NRDBAb5xUT1RiT4o5hxv27cUYEYLvxA6uOqZMx5tsQQbKvzc7jfrfUM9Fcx
         QKHYCRF2VXX/OUctO7jrejvnvYOOSgXOOWzQ6gla1sQvsbrXwbaaAXFWsIm0raSSamUE
         hbIOjrES1IYiksvuy8za5AcmlAKTIW84DAnkb8R0IuSRPwYh1g7ltzuO36907HJ6lne+
         Wwnjll+IcpP9Qx74zv66NiFcrkw4PpmpPH29iX69xS3tQT3HK92BQ/mvx9TlLmAF1UQk
         0LQ69ycQwyrPstqAw0yQ2eAjnjZqC6MqzZDXTYrrQFgaqU/kxOpyTksFkYR3hJNNCUU+
         kUWw==
X-Forwarded-Encrypted: i=1; AJvYcCUtsIOwCAzz4wELNIqAgxEKjz9gsdJgjDvG4OJIzkSeSBzQ5fMedDdWL9NkFg2ZwDg1Lu16inNCggkg@vger.kernel.org, AJvYcCV8td3kNoqQ1VZIcyZpquZvI064qeoEtnqzxsRkte2gojhpm8cnkt+ptjWGByfOK7s7uQZY7K3ryROOMQYv@vger.kernel.org, AJvYcCWs2p3Z5WDk9CBXg+gzyCQ7cgTX8ESrbyjAH82VTmyraW8luL8vshBCPTWbo61GULgg/+DkGaQkUAnN@vger.kernel.org
X-Gm-Message-State: AOJu0YwR/CVJSZ/1lPhrDf7KL0uJE7mAI0/ddkgEyiIhNjkQAc7vj7H0
	Isvdp4q74Vg+NSOl6IraZ3KzRv9sxyl41FyexQk3mo7gquc1Zio4
X-Google-Smtp-Source: AGHT+IHjfUP/pr5T06lHliXG4NOQ1LL65S0N/4RW2d4pxaFsbnGQ8qCLUaPc+XxPMqb2155fHi7+YA==
X-Received: by 2002:a05:6000:e12:b0:371:913d:e50b with SMTP id ffacd0b85a97d-3749b55260cmr3578656f8f.31.1725004133875;
        Fri, 30 Aug 2024 00:48:53 -0700 (PDT)
Received: from ubuntu2204 (fgw-godollo.uni-mate.hu. [192.188.242.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42bb6e27c70sm37651185e9.35.2024.08.30.00.48.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2024 00:48:53 -0700 (PDT)
Date: Fri, 30 Aug 2024 09:48:51 +0200
From: =?utf-8?B?VMOzdGggSsOhbm9z?= <gomba007@gmail.com>
To: Conor Dooley <conor@kernel.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org, 
	csokas.bence@prolan.hu, devicetree@vger.kernel.org
Subject: Re: [PATCH v6 2/2] dt-bindings: rtc: Add support for SD2405AL.
Message-ID: <u2izwxobgubemursee5f4l7zfk4qgztfpc6m2e5bat6ac5hipp@hlna5zhzzuq4>
References: <20240829-rtc-sd2405al-v6-0-4fbfe2624aa7@gmail.com>
 <20240829-rtc-sd2405al-v6-2-4fbfe2624aa7@gmail.com>
 <20240829-reissue-curtsy-3c7c10d0797f@spud>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240829-reissue-curtsy-3c7c10d0797f@spud>

Dear Conor,

thank you for your review!

> Both of these should really be two different patches

Sure, I'll split them.

> provide a link to the vendor in the vendor-prefixes patch.

Okay.

Regards,
János


