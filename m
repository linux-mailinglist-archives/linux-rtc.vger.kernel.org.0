Return-Path: <linux-rtc+bounces-1921-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C51BF9740BD
	for <lists+linux-rtc@lfdr.de>; Tue, 10 Sep 2024 19:41:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 53B1CB27BC4
	for <lists+linux-rtc@lfdr.de>; Tue, 10 Sep 2024 17:40:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8A051AC45C;
	Tue, 10 Sep 2024 17:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk header.b="cAhgTkSj"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FA761AC44E
	for <linux-rtc@vger.kernel.org>; Tue, 10 Sep 2024 17:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725989563; cv=none; b=YEFINq+M97UTTzQukjJ9L5Tws4EZ5Y9SVQU6Nr4XOM5KzMT8iYZAZakV9MlfFw/fezHheW6qOH83L+/eMDvOZOc5JGU38Vg6zRvsRXSo59AvnZpeRqOZl5QC3mYILPvAJRrQ1sWsjaHy3uALUAo0qcUByKQSf6STRMvZnhIkEGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725989563; c=relaxed/simple;
	bh=+OQCKGjOreNPFlCZg+NpojIK/AAqvIGpCbTctLN41Zg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=KnsVgudG3soJ38Dm1LN15Bh4QERe9xe1s0+FGiyQIqRe/mcOVXHh6hWZlJIQdnJUzbYqPvDAsQwuhkZmd+lXFzz26oqcjAst66tcl+Ucu9nt29PKdcAS8MWPNafBDZhwNkqz/JBVLEHdboHKyXUYfpovktmvwYMiq4MXC6Ji0iQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rasmusvillemoes.dk; spf=pass smtp.mailfrom=rasmusvillemoes.dk; dkim=pass (1024-bit key) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk header.b=cAhgTkSj; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rasmusvillemoes.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rasmusvillemoes.dk
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5c3cdbe4728so5953787a12.2
        for <linux-rtc@vger.kernel.org>; Tue, 10 Sep 2024 10:32:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google; t=1725989560; x=1726594360; darn=vger.kernel.org;
        h=mime-version:user-agent:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+OQCKGjOreNPFlCZg+NpojIK/AAqvIGpCbTctLN41Zg=;
        b=cAhgTkSjTriCP5c1OIndbZi7f4qNqqcoK0jFreASZoAeZLwUynL1laLSiR4OpsGZmd
         PjiPATe4hYxEb3eEGeDcbewiSvt3Fafh/bowhSfOOLpC2/zQyOiHsuZvv3vv33jNWoWB
         9IofsugZGUjNbd/+vBlXDCTkHYgWtyAVaFNzI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725989560; x=1726594360;
        h=mime-version:user-agent:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+OQCKGjOreNPFlCZg+NpojIK/AAqvIGpCbTctLN41Zg=;
        b=gmOpnvWSAordoecFDCswZohgzsBBeKrDHfrrma1IG1AfL9LntLLpZy0O85LKXmeyiW
         y8w1Zd3K+xtFr9w3neo4J9q5WqAu/akEbxv2ahbFxnxlDMKQf2dPXT9qIjnaSxtqCDT5
         vxzC8F5A5Y8NvuQK1ycxEwv7xU5kj3Bx/ayH4vGgGKyN0nEAFPm2Q/A6/o9sR7JSoPy6
         GNMF2jrSTjwQKeyP3Sv/OeeiG8iNjyYMnIFrTSP57hLQsC2M5RBGASMYnBNlIWf/kLsi
         /JzFpdAxIj3tttHZNHwumfCTgCMtPdWfik9qAb0tyBDt6RNzt+f/ow3CUXN+GLrkl50i
         lfpA==
X-Forwarded-Encrypted: i=1; AJvYcCUp9/2YRNxmCqJWYzPb+qxF+XNCUGGUS175UqhdLRmXmQ2awlOoGkxA7Jo9iYj7FEZdmDPJo87Zy4w=@vger.kernel.org
X-Gm-Message-State: AOJu0YxhSpKVuJEExJJrpAFIc4ciWqYcVEeqcoYVI8UQDvkdmgc55lCI
	1Pg9mmXgp07fbA+/9ELiU4upQTQ1eaZPX+bBy+imLZTUtSU0VBRtrSNucjqPJLo=
X-Google-Smtp-Source: AGHT+IFfyjBY/uzGM6saZRblrDwQ8lp+ygNcmBWjQ5jvHL2+iO/HSsVfBt74/1cYQ1N5XfuDXvGFrQ==
X-Received: by 2002:a05:6402:50c7:b0:5c3:cc6d:19df with SMTP id 4fb4d7f45d1cf-5c3eac20c84mr9233359a12.28.1725989559644;
        Tue, 10 Sep 2024 10:32:39 -0700 (PDT)
Received: from localhost (77.33.185.121.dhcp.fibianet.dk. [77.33.185.121])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c3ebd467desm4436849a12.40.2024.09.10.10.32.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 10:32:39 -0700 (PDT)
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
To: Esben Haabendal <esben@geanix.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,  Rasmus Villemoes
 <linux@rasmusvillemoes.dk>,  linux-rtc@vger.kernel.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] rtc: isl12022: Prepare for extending rtc device
 drvdata
In-Reply-To: <20240910-rtc-isl12022-alarm-irq-v1-1-d875cedc997f@geanix.com>
	(Esben Haabendal's message of "Tue, 10 Sep 2024 12:27:10 +0200")
References: <20240910-rtc-isl12022-alarm-irq-v1-0-d875cedc997f@geanix.com>
	<20240910-rtc-isl12022-alarm-irq-v1-1-d875cedc997f@geanix.com>
Date: Tue, 10 Sep 2024 19:32:41 +0200
Message-ID: <87a5gfifd2.fsf@prevas.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Esben Haabendal <esben@geanix.com> writes:

> Add a struct to hold the regmap pointer, so more information can be
> added.

Heh, this is morally a revert of f525b210e9d4.

Acked-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>

