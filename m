Return-Path: <linux-rtc+bounces-6044-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uGK4ExvPnGllKQQAu9opvQ
	(envelope-from <linux-rtc+bounces-6044-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Mon, 23 Feb 2026 23:05:15 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BB24F17DF6E
	for <lists+linux-rtc@lfdr.de>; Mon, 23 Feb 2026 23:05:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D88DA30C1EBE
	for <lists+linux-rtc@lfdr.de>; Mon, 23 Feb 2026 22:02:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CED9D37B3F1;
	Mon, 23 Feb 2026 22:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QvHbEZ/z"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CC7437AA95
	for <linux-rtc@vger.kernel.org>; Mon, 23 Feb 2026 22:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771884103; cv=none; b=kDp5X40rd/gsnsdvv688yuSmJyHh0biRZq3TXcG8v+T81BCrW50kVcJxeu/jIX2mq3cezBjsbiHIMRBoHQKgkoaOtpP/Y/0IxSdTaDqbJ0e38+Ly/7NQpAe757uheGvhlaTlKOxHTOpfVXiFF3PDpi2PEiisGubin0YQnl8loko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771884103; c=relaxed/simple;
	bh=KUvMCXecxl1oTGRP8RuaVCGSIIYXm2h5FZ/R4PUy4Tg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JCHxLFTH7Tw+dajtP3g+FOqWJTORmh8zgFVpkpfD9VEP+SwUZ9rMRLe5EGGHnPHix0aEc79a37eGmsOwkK1SjcfRCwpJFUOrEQ5wMSwJL3I7/YO81FTpd7SXhruKvboMkIg51gSD3DgN/xb6/f3gQzfll3j6e4r1H0xS+FcByFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QvHbEZ/z; arc=none smtp.client-ip=74.125.82.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-12732e6a123so841275c88.1
        for <linux-rtc@vger.kernel.org>; Mon, 23 Feb 2026 14:01:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771884102; x=1772488902; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vwmeVddzSBrk6onBg3XthXPBezPsVZCBdsI2Jvj2LQw=;
        b=QvHbEZ/zBwB13I1oFN0JKZF4+aL98Vk/gQFKF2IlM4SA3XRYV0AFs1Kjojh0PeVMu4
         cz3CIcmfZOVs+gbbDlmSlM7WZRTj4E5hSSZidqpghyMyxel5WXw53ZzEFMv+56k2lz5J
         rrUM1BkggQOdS+UyyHscjQbejOR1PwXA/fDUO4BS+W6cpUT+JIWTiRi+IOx/a24mJJUs
         bMWG64y8UL6YeleC+WO3CwWUH1JhQlPVe6d/MknRQAzelYq3ltUPGHp8bgo+dYKO31Jq
         lWtJv+bUdT7g/CMcCmRoFolI705er4sebiEpIoMFHcNnBeq6Qjqjv0lDlNw/E3KywWSZ
         COuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771884102; x=1772488902;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vwmeVddzSBrk6onBg3XthXPBezPsVZCBdsI2Jvj2LQw=;
        b=RkHL86J7xfgW42K0ckolNK7kdRkn29aweUugBp1NKK/grcA2skw47cd5dO3NitUjGc
         rJThpBRZpAhLdW7Q1E6x6TYqaBj+Rf+EC3uRa58Ey6OZLTJwfgn0QtHyZNBtWNmHK/VS
         0SNPjyyUSLOpU5CUZDyn6VHn/690K0k6ovnLHOTPZ9YToQ++Gl3+r3UVCBEYAj/jm4Z2
         uJZcbCbKfad8SGqH/reb7+uMx2p1/OMObeV9GSwq978ZyDk4tlwqCcncVu0aqBY6Lzlx
         nGtpO4ogfhNPnjE6XeB9ZL88icez8MtSLM5LG1hB7vzzNskMh5+u3PkHL0zEUH6FMCHG
         Uspg==
X-Forwarded-Encrypted: i=1; AJvYcCWypyGTha9nht3w19195EllMorj2G1GjJ6F8PmdDWIoqpJjLNIkjAh8UpjSQjqYGjLp2pxi4PVyb10=@vger.kernel.org
X-Gm-Message-State: AOJu0YxcGakXKBUqJeF4AM06G7kXR7NK2zEjrp1b+dVttMDmBiFshki7
	ju6TelpoBE1+0yZHpvE6473+5ZazfTbueNzWSzFJbeUPcqOEkZEg9P/Y
X-Gm-Gg: AZuq6aKfqJScCsWdUrTtLDWdR1Fv+n9e9ZaCMoCPZaegT9LMEtmC1JfxsWZT2VUyO3X
	bTLjrGfKjW2q4F0BMIdQJpGwZdbzP7CJCD7DqXdR3PdBa+4AgD6AG1tStTSH9pIMFQTFqFRdBGU
	kEAZmBe6bkFjNVRw7JPbH1rCIQal43tI1GkELzKyUn+fdq737mirXBmhAL65kfLcgmsfa45nM2w
	UEv+SQJK8zneeqFPFshBv4uur6kKIqcWMp7HQn5XY54ZcQ3Cs+GHZnQA7IxGc8X23qmluuE1UO1
	jw8ixzj7iJ7PFuJa1xwA02F1TH+eVVQm4fplVX1mfYZ+oi5JSGo/obpvlzT2V5yRP0dxVL6CPG/
	p6taLNv69Y3lIUCvAHeJfhefUCvoHc2QfH/0AnD97e50Ln8xIrN3Ru8qC+Tf6WjzMejeGoroMxW
	0kRKMBXd9UL1zlAKHGX+FpzQy6ItO5L05hTDnejPzXofFpUvL1uTOooUX0eUQ48TpQ
X-Received: by 2002:a05:7022:2521:b0:11b:9386:a3c8 with SMTP id a92af1059eb24-1276ad8bb87mr4839876c88.41.1771884101638;
        Mon, 23 Feb 2026 14:01:41 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:1b48:5d6e:ab6e:5287])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1276af2edd7sm9460001c88.8.2026.02.23.14.01.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 14:01:41 -0800 (PST)
Date: Mon, 23 Feb 2026 14:01:37 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: linux-mediatek@lists.infradead.org, Fabien Parent <parent.f@gmail.com>, 
	Val Packett <val@packett.cool>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
	Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Eddie Huang <eddie.huang@mediatek.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Julien Massot <julien.massot@collabora.com>, 
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>, Gary Bisson <bisson.gary@gmail.com>, 
	Chen Zhong <chen.zhong@mediatek.com>, linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rtc@vger.kernel.org
Subject: Re: [PATCH 3/9] dt-bindings: input: mtk-pmic-keys: add MT6392
 binding definition
Message-ID: <aZzOHVh10zr9hiWs@google.com>
References: <cover.1771865014.git.l.scorcia@gmail.com>
 <056cbc09fcbb4a2845cece69209a2a564d993ac5.1771865015.git.l.scorcia@gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <056cbc09fcbb4a2845cece69209a2a564d993ac5.1771865015.git.l.scorcia@gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6044-lists,linux-rtc=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[lists.infradead.org,gmail.com,packett.cool,kernel.org,mediatek.com,collabora.com,bootlin.com,vger.kernel.org];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,packett.cool:email]
X-Rspamd-Queue-Id: BB24F17DF6E
X-Rspamd-Action: no action

On Mon, Feb 23, 2026 at 05:12:42PM +0000, Luca Leonardo Scorcia wrote:
> From: Fabien Parent <parent.f@gmail.com>
> 
> Add the binding documentation of the mtk-pmic-keys for the MT6392 PMICs.
> 
> Signed-off-by: Fabien Parent <parent.f@gmail.com>
> Signed-off-by: Val Packett <val@packett.cool>
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>

Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Please merge with the rest of the series.

> ---
>  Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml b/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml
> index b95435bd6a9b..2d3c4161a7f8 100644
> --- a/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml
> +++ b/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml
> @@ -30,6 +30,7 @@ properties:
>        - mediatek,mt6357-keys
>        - mediatek,mt6358-keys
>        - mediatek,mt6359-keys
> +      - mediatek,mt6392-keys
>        - mediatek,mt6397-keys
>  
>    power-off-time-sec: true

Thanks.

-- 
Dmitry

