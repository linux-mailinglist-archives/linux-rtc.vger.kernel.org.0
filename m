Return-Path: <linux-rtc+bounces-6594-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6A85C4hnHGqDNgkAu9opvQ
	(envelope-from <linux-rtc+bounces-6594-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Sun, 31 May 2026 18:53:28 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 85614617321
	for <lists+linux-rtc@lfdr.de>; Sun, 31 May 2026 18:53:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 135DB300A8F8
	for <lists+linux-rtc@lfdr.de>; Sun, 31 May 2026 16:51:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6C0037DEBC;
	Sun, 31 May 2026 16:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="peeqh5NJ"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7316F35E936
	for <linux-rtc@vger.kernel.org>; Sun, 31 May 2026 16:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780246289; cv=pass; b=k14yPk0mkpQgAPjtQx8rxaptk6H0ERxobzYEMBuuQI/QEm9RY/anLVcAOP730h+fYl0XaBdoYCBTQbdi0obqYltczVS+yPNVs8VJvpFJtFz4Yx7joHNdMGIIZ08RBPOGlsxQ7UUpZP1rB2GxQgVPBcrjgCRsAdJcXmr/YUEQ+Vg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780246289; c=relaxed/simple;
	bh=Rq6s90n83xxkJTxEv7NRjVrE+KT9lkAEQf8wwfCtfbs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MerMochmEdZAQ9N/wJ5b1ZmT9zH9t0P/ZgVu8SevekOMrOfxeOxp0NhddRoFNfYBwgd0y6oHkBxQP0epCZvUTB3xdgrTmkKRxF4qsIRXhKnBH+0t9TaJAD/D0jCP6nbYsI7muUqAgfQrDrPhuMQGErM9yqCtcBGWhdcY8mBuzOc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=peeqh5NJ; arc=pass smtp.client-ip=74.125.224.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-660323f7b27so3916891d50.3
        for <linux-rtc@vger.kernel.org>; Sun, 31 May 2026 09:51:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780246287; cv=none;
        d=google.com; s=arc-20240605;
        b=MMKQsqi5iGN/n8kz/c0AKL5SbQQl4hnPAC9XCcepS00XzYaXdNrdFpxLxr3hdkA7v7
         OsulYBo4urEZXYmA+cIzMAEsalyIXWh0peRh2Pl2scziSZahPgCTDotOcvAmNeiYXRFf
         jhuf1wpwLSeKNpcs9nr5eU1akanzX2p3il7zeApTPIWOLkqVYKlw+bMMhcmBg+NaIaEC
         H4dFM39IN69eBp5mbEGZ3AP1As6M+QWg0y6QEYyVxGtdn7hf1fNtWNgva3oMRijf3cAm
         uKwUR/CpfnZitONjrOKwtFFQX5Vkt33NUS4HRjb5oYf5K9u+/aueIHeYWEXWiRR6v06C
         Bxvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=jD3qH3IJMUeJlTuvpQInOEvbulEnoTmyx72o6iGnBpM=;
        fh=myLGbt8Na1tgQpEmClymx3WI7K6Kri3aFNPGHnAys/8=;
        b=HmKwwz73Sf0djcUl4g/7i7rVpEtEg1pCwPEoaLRc8cCRTi64plwosJTGKiJZEUq2Eq
         vo/YfJ706SInUCOwxar3Tn6DD9ShHnnHVuKmypbcK8WXHTHoygbpmx7NU4Wcog18wj3g
         g7JrFUmqnmQOiHVgvkWEe6H9EVduYymGw8RPaOH3AK5lic2/sNzmFfUJeaMGsNGh+UP9
         TA+sUs/Dy+T5RKbs42JrZeb7PnpK0eIqbbd8yc+Ve1aRMLzb1jYsWVLXGWIQC08lX5TI
         8cBbb9dQBg7ujfcYtgHJBBFgafch93bZQ5rQMNtFNMJduykK/TJ4ITpY8GcC6DM+MrYf
         ycCw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780246287; x=1780851087; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jD3qH3IJMUeJlTuvpQInOEvbulEnoTmyx72o6iGnBpM=;
        b=peeqh5NJE4z3m0VYZVzyzFy/kgX99X7+n1cH500CojL4C+mX1jQOUlQaRxHy3IxfKq
         1DFi04GBmXq6H2GPI8U7S0Gsfwm1yNaYuAXZfcfROGCZO0h5Nu3hA/q0gslJ0Zvm7CNf
         CPbXiVSLtUA2eRftOQMGC4YlzJ2mjyJLDFaQPnNhhYrKzSmVK7/+WpSyHEdfvEhSXjbh
         Q57UZmahBC742vow7ONPUxZi4+QQ+YfiHQiIF1OIuDEghsRXRsiozsaWzHODjgXxMCmp
         MZYR8gy1OEa+dUryBHRcI5KOJJxCCMzdxSGP5pEojbfPOUEKuaE459RS0GnS+NE8B4dI
         lbIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780246287; x=1780851087;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jD3qH3IJMUeJlTuvpQInOEvbulEnoTmyx72o6iGnBpM=;
        b=Kc2xwp16UQc5CzBegJ0200pNCf7aGr94Vzlp2E7KtEB2izuXU4J+SEP6kjLjxFHFYZ
         bazT877MerLzd1XAsMW/hfkIlmdtRM6qSfeVuQzun7xVGZ1Kw1mLQiWmOljHqSSiJVP3
         VGe8NIMgRSyk4smv+cinxjUYKl/iSxb76f/ILlOoZ2Wx6e+yHOeFMunmzYIPjHUjM0a5
         v445dT3ZsNiYg+Rhl2SZTbmJK7exEXka53gzztnfEzSiTLwwBtZhK1yHSEkKzuXGnCWt
         J5fspSqDO7C0HtHYNCNfUUFLbRXi8F0d77MPZV97549Z8sqms/s2uwTDCZQAfr4ZJihq
         +sUw==
X-Forwarded-Encrypted: i=1; AFNElJ/HabEFURYacuyQiDkVohHvqoX26f4iSRU4c6Uy8YBI5E76Y1+89oxj9KnxMDxWgGl8g6fM4xDQ2Us=@vger.kernel.org
X-Gm-Message-State: AOJu0YzgFqUEw48XGqKvR8HeXHkhc5mcUWyKHtQ2GC6go1y37m/STiLG
	sZf7OH7ph42jwrtXgW7hM5GVKTk4Dv0iRxGZRaqBTSxZX/bnjbd2h0BO+dYyOkOKNJKj7urdquv
	o+2p7IOkpKHJ0raC3EKWum0MlzXxDgjM=
X-Gm-Gg: Acq92OG+xtActPKLz45AcMLuBA0E6eNTLA6rv6xGDkW6YhK4QFlfFyR9W6NYmg1xDLj
	EVcD1+4oCrxjouI3EKi64aFbxDPAowt4eGk6yx2cfLwabmhy28iO/OrEy7q66gxPktq4utvVCD9
	kbGM3hRurWFoKWOHmUnQBvZgKBBilCuJQPMZJZHM0NErHEUXsBRL+y77wHdJTK6owDk/WKd+sd8
	RYpk9KwQr6e63tzUfER091EaGc7eFX2KJOdSLB8/74oMNffAK63+cXlDe6Im9mk4CE1zmdGCdkB
	dJ1SzN5Ctpu9waZxmQ==
X-Received: by 2002:a05:690e:4843:b0:65e:41a4:54d2 with SMTP id
 956f58d0204a3-6605f4b3bc3mr4092648d50.32.1780246287521; Sun, 31 May 2026
 09:51:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260524110047.37590-1-challauday369@gmail.com> <20260530-devious-magnificent-jackdaw-cc48c1@quoll>
In-Reply-To: <20260530-devious-magnificent-jackdaw-cc48c1@quoll>
From: Uday Kiran <challauday369@gmail.com>
Date: Sun, 31 May 2026 22:21:15 +0530
X-Gm-Features: AVHnY4JuA3xNsJwo3RGuS42nPmcJ6QBLOR3huKxUD2Jd3JIeqE8md7vxSzw9-ME
Message-ID: <CAAj-GBnDiiKPwCQz1KDp6kMx9mQzmxSJpAuanbWsjt4iSzoZQQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: arm: vt8500: via,vt8500-pmc: Convert to DT Schema
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux@prisktech.co.nz, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, skhan@linuxfoundation.org, me@brighamcampbell.com, 
	linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6594-lists,linux-rtc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[challauday369@gmail.com,linux-rtc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 85614617321
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

> > +properties:
> > +  compatible:
> > +    const: via,vt8500-pmc
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    type: object
> > +    additionalProperties: true
>
> No, binding must be constrained. See writing-bindings or any other
> binding. If you are unsure how to do something - open other existing
> bindings. Do you see anywhere such syntax?

Agreed. The clocks child node is now fully constrained: #address-cells and
#size-cells are declared with fixed values and marked required.
additionalProperties: true is retained only because the child clock nodes
inside have their own schema (via,vt8500-clock.yaml) with
additionalProperties: false, which is the pattern described in
example-schema.yaml for child nodes with their own device schema.

Regards,
Udaya Kiran Challa

