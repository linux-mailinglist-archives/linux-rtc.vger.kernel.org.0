Return-Path: <linux-rtc+bounces-6042-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IFp7ADaVnGlOJgQAu9opvQ
	(envelope-from <linux-rtc+bounces-6042-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Mon, 23 Feb 2026 18:58:14 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5887D17B2F8
	for <lists+linux-rtc@lfdr.de>; Mon, 23 Feb 2026 18:58:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 02A713127894
	for <lists+linux-rtc@lfdr.de>; Mon, 23 Feb 2026 17:55:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5401A33A02B;
	Mon, 23 Feb 2026 17:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dH3ig7Dc"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A1F0339B32
	for <linux-rtc@vger.kernel.org>; Mon, 23 Feb 2026 17:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771869314; cv=none; b=D2pTWALPlDGdkuFf2G2llV438/R7EdtDwEjzEerfwg6fhq3OmU/1jE6U/0hdqr+i/mzJHHfqVSAkG8BnrMnG/wwJF5OSw6WL3cLs7LGIIDwYEIq7kPECcn5UoM3oFNi/MTGeoEf+yopIxSDAkgTnXgBktjx9gckwOIyE4QzYFQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771869314; c=relaxed/simple;
	bh=JF1KZ8us1B4UC6UAm56h5UA3Lh/N4+4s3jylcnX4xUQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D5W0jdwyfFXRhSJByinwNXvh7KpnAk4q19b37MTQCCGB0QG1G0i6ATrJnH/UX1iOjP8k5lBDRDb3g0pwH5xlAa5D/DP2iierz1Je4Y18RGcAq8GXSZY7/BJHnX6LgGcfB4KsYZ6MtwrwJf+LF33XeBFHkc2lLZARC2+RMgFGtgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dH3ig7Dc; arc=none smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1271195d2a7so105406c88.0
        for <linux-rtc@vger.kernel.org>; Mon, 23 Feb 2026 09:55:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771869312; x=1772474112; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8S3D2amG83bMjq3rYrixdtz5QNwrXVFuIOF99KB48r8=;
        b=dH3ig7DcgoD2/IW68Ckw0bdharNJTHMFc8etCmoR7iPRba+y5eJ54Y/r9E7U/Iuhod
         Ldi7g3QsXsNHLG/DmGqqjxwdZ9JL40yDti4z6Nc2tM7xmz8HnDo6RWArOd3yX0fz5Hsd
         xjDXOs8dtiFrX/7NHm3illACfYNA9365Qet69FJ5E8x8HVGAevDgBcbxjwiG6JJX4GQG
         4q9ElXskCyiGdnCjF7jYImsZyd3+vA8sSie3IHYr6H/nv5Y76UwBX0a3MPhNq+4AHVa9
         UutxyWd5vr9DxURjxnQDQsygsoC8EgZzOM1gJb5Q6yFuWuPmSh0yJT4oiF2hOGJkAQDZ
         X9kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771869312; x=1772474112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8S3D2amG83bMjq3rYrixdtz5QNwrXVFuIOF99KB48r8=;
        b=AdQ3hR46H+0wXSUfNJGAeu1IWwzIKGceVZo64As9c/lVvMTfA943E7mCIHMQOfTIc2
         39dtrymXasgeilgS+rMEyasJ5btxwO/UEhiic+sTjk7pJ2GwwWsUguRyYqHcN+nI0QC2
         1g599AhqDaen0DK3ThTEN4oXQMLWDfVXO+d4tU78xtIYpq03dNNeyJxlijBjRI31wDFG
         0P3FFz/8dg/OlAy6IRlIOnmwV9rWgTxuMtNH2Jf5vpC5oKrZ4piPOg+WarsbMFQP8R2X
         OvWlLfWeOJ71I9BclVySX+c1LPY6jvApBpLHhFyjBbfngHCFy8/Tpo76qRm/UEhEpCm7
         87xQ==
X-Forwarded-Encrypted: i=1; AJvYcCUzV73fWZWMivrbNp9YquPtEnWNTUh+qm8clnrUTUxjOy7/nUFL6GlvlSZyJsV6rc4Kxtd+vRT9Ij8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxfVlHhXCXf+3jw3wwYHFNSqrdiktWIP+QgqKkKfiC7g2hQtWi6
	H1FMBW8RzgBFRhpDFtvTb/Wjti/YJCX1P85iMmlCpOCVLTow7gGye2dQ
X-Gm-Gg: AZuq6aKzKbCAsXsRhg8cY9lZIJn/7KrzFFETEiU5akeuDUKTWqiDeLfmiYjFERMmdUt
	JKQOfNMWSfQ3p1y6DnhDjaxcE7wbpywdFtZ6wusI083KxKXRCeF1daG2IHGOmJ04YVYR+ywZwrk
	5U4h1dUUBAVaOx7AMs9yfdgcGGshChBXMdPIvkRX9xI+ZsBs173O0bOAMrNJqi7zqNo1EIDE1C8
	cktY5f/aKJQzwAIhIqXuTqCOfsGQ5QCJqTRXpHxGeaU/R/uxHM0kZOSNAHF2j5sObx+hda24OSF
	Q96uy5GuJm5hXdJVhfoOqZC/dZJzD/Ueb3YtDVjxSib4DwL0IyhNS7jMlIBM+osuChOR0Y3n5b1
	z77O0ub+dFMN7yBrdwkUW8P2h2maYjRHsCt72wke795GkR5LwZysijdiVgcoWW52U9jAqpHsL0A
	QLiC7GZ2P6VETOG8jAOKWy+HOG/IvjpjnLc27xx0HBs6lwgX8rG1fELe8tSfd2JcsZMSo8fEd5C
	Vs=
X-Received: by 2002:a05:7022:2214:b0:11b:9386:a3bf with SMTP id a92af1059eb24-1276ad61a70mr4534016c88.42.1771869312175;
        Mon, 23 Feb 2026 09:55:12 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:1b48:5d6e:ab6e:5287])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1276af7ad65sm7334624c88.11.2026.02.23.09.55.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 09:55:11 -0800 (PST)
Date: Mon, 23 Feb 2026 09:55:08 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: linux-mediatek@lists.infradead.org, Val Packett <val@packett.cool>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Sen Chu <sen.chu@mediatek.com>, 
	Sean Wang <sean.wang@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>, 
	Lee Jones <lee@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Eddie Huang <eddie.huang@mediatek.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Gary Bisson <bisson.gary@gmail.com>, 
	Julien Massot <julien.massot@collabora.com>, Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>, 
	Fabien Parent <parent.f@gmail.com>, Chen Zhong <chen.zhong@mediatek.com>, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org
Subject: Re: [PATCH 7/9] input: keyboard: mtk-pmic-keys: add MT6392 support
Message-ID: <aZyUXip4zgeDUdVQ@google.com>
References: <cover.1771865014.git.l.scorcia@gmail.com>
 <2c96591313084d240ac94b9d42d91d984fa9bce7.1771865015.git.l.scorcia@gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2c96591313084d240ac94b9d42d91d984fa9bce7.1771865015.git.l.scorcia@gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6042-lists,linux-rtc=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[lists.infradead.org,packett.cool,kernel.org,mediatek.com,gmail.com,collabora.com,bootlin.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[27];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitrytorokhov@gmail.com,linux-rtc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5887D17B2F8
X-Rspamd-Action: no action

On Mon, Feb 23, 2026 at 05:12:46PM +0000, Luca Leonardo Scorcia wrote:
> From: Val Packett <val@packett.cool>
> 
> Add support for the MT6392 PMIC to the keys driver.
> 
> Signed-off-by: Val Packett <val@packett.cool>
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>

Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Please feel free to merge with the rest of the series.

Thanks.

-- 
Dmitry

